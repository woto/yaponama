class OrdersController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.user_or_admin(current_user).order("id desc").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.user_or_admin(current_user).find(params[:id])
    @wishes = @order.wishes.where(:status => :ordered)

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

  # # GET /orders/1/edit
  # def edit
  #   @order = Order.find(params[:id])
  # end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])    
    @order.user = current_user

    respond_to do |format|
      if @order.save
        wishes = Wish.where(:user_id => current_user).where(:status => :active)
        wishes.update_all(:order_id => @order.id, :status => :ordered)
                
        format.html { redirect_to @order, :notice => 'Ваш заказ успешно создан.' }
        format.json { render :json => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # # PUT /orders/1
  # # PUT /orders/1.json
  # def update
  #   @order = Order.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @order.update_attributes(params[:order])
  #       format.html { redirect_to @order, :notice => 'Order was successfully updated.' }
  #       format.json { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.json { render :json => @order.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.where(:user_id => current_user.id).find(params[:id])
    @order.wishes.update_all(:order_id => nil, :status => :active)    
    @order.destroy

    respond_to do |format|
      format.html { redirect_to wishes_path }
      format.json { head :ok }
    end
  end
end
