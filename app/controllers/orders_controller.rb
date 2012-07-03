class OrdersController < ApplicationController
  respond_to :html, :mobile

  before_filter :authenticate_user!
  before_filter :fetch_checkout
  before_filter :is_admin?, :only => [:edit, :update]
  before_filter :fetch_order, :except => [:index, :create]

  def fetch_order
    @order = Order.user_or_admin(current_user).find(params[:id])
  end

  def fetch_checkout
    @checkout = Checkout.new(params)
  end

  # DONE
  def choose
    if @order.status != :processed
      render :text => "Уважаемый покупатель, статус вашего заказа \"Ожидает обработки\". Вы сможете оплатить заказ только после рассмотрения заказа менеджером и перехода заказа в стаус \"Обработан\", а пока что Вы можете ознакомиться с способами оплаты на странице #{view_context.link_to "Оплата", payment_path}.", :layout => true and return
    else
      respond_to do |format|
        format.html
        format.mobile
      end
    end
  end

  # DONE
  def print
    if @checkout.valid? 
      respond_with do |format|
        format.html { render 'print.erb', :layout => false }
        format.mobile { render 'print.erb', :layout => false }
      end
    end
  end

  
  # DONE
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.user_or_admin(current_user).order("id desc").page(params[:page])
    @meta_title = "Список заказов"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @orders }
    end
  end

  # DONE
  # GET /orders/1
  # GET /orders/1.json
  def show
    @wishes = @order.wishes.where(:status => :ordered)

    @wishes.each do |wish|
      hide_or_show_catalog_number(wish)
    end

    @meta_title = "Просмотр заказа № #{@order.id}"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @order }
    end
  end

  # # GET /orders/new
  # # GET /orders/new.json
  # def new
  #   @order = Order.new
  #   @wishes = Wish.guest_or_user(current_user, request.session_options[:id]).where(:status => :active)
  #   
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render :json => @order }
  #   end
  # end


  # DONE
  # GET /orders/1/edit
  #def edit
  #  @order = Order.find(params[:id])
  #end

  # DONE
  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])    
    @order.user = current_user

    respond_to do |format|
      if @order.save
        wishes = Wish.where(:user_id => current_user).where(:status => :active)
        wishes.update_all(:order_id => @order.id, :status => :ordered)
        format.mobile { redirect_to order_path(@order, :anchor => :jump), :notice => 'Ваш заказ успешно создан. В ближайшее время с вами свяжется менеджер.' }
        format.html { redirect_to @order, :notice => 'Ваш заказ успешно создан. В ближайшее время с вами свяжется менеджер.' }
        format.json { render :json => @order, :status => :created, :location => @order }
      else
        format.mobile { render :action => "new" }        
        format.html { render :action => "new" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    respond_to do |format|
      @order.status = :processed
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, :notice => 'Изменения по заказу сохранены.' }
        format.mobile { redirect_to order_path(@order, :anchor => "jump"), :notice => 'Изменения по заказу сохранены.' }
        format.json { head :ok }
      else
        render "edit" and return
      end
    end
  end

  # DONE
  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.where(:user_id => current_user.id).where(:status => :awaiting).find(params[:id])
    @order.wishes.update_all(:order_id => nil, :status => :active)    
    @order.destroy

    respond_to do |format|
      format.mobile {redirect_to wishes_path(:anchor => "jump"), :notice => "Заказ успешно отменен."}
      format.html { redirect_to wishes_path }
      format.json { head :ok }
    end
  end
end
