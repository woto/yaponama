class WishesController < ApplicationController
  # GET /wishes
  # GET /wishes.json
  def index
    
    @wishes = user_wishes
    content_for :title, "Корзина"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @wishes }
    end
  end

  # # GET /wishes/1
  #   # GET /wishes/1.json
  #   def show
  #     @wish = Wish.find(params[:id])
  # 
  #     respond_to do |format|
  #       format.html # show.html.erb
  #       format.json { render :json => @wish }
  #     end
  #   end
  #
  # # GET /wishes/new
  # # GET /wishes/new.json
  # def new
  #   @wish = Wish.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render :json => @wish }
  #   end
  # end
  # 
  # # GET /wishes/1/edit
  # def edit
  #   @wish = Wish.find(params[:id])
  # end
  
  # POST /wishes
  # POST /wishes.json
  def create
    @wish = Wish.guest_or_user(current_user, request.session_options[:id]).where(
      :cost => params[:wish][:cost],
      :catalog_number => params[:wish][:catalog_number],
      :manufacturer => params[:wish][:manufacturer],
      :title => params[:wish][:title],
      :count => params[:wish][:count],
      :declared => params[:wish][:declared],
      :average => params[:wish][:average],
      :country => params[:wish][:country]
    ).where("status = 'active'").first
    
    unless @wish.present?
      @wish = Wish.new(params[:wish])
    end
    
    @wish.increment!(:count_in_wishes)    
    @wish.status = "active"
    @wish.user = current_user
    @wish.session_id = request.session_options[:id]

    respond_to do |format|
      if @wish.save
        format.json { render :json => @wish, :status => :created, :location => @wish }
        # Если с мобильной версии сайта
        unless request.xhr?
          redirect_to search_searches_path(:skip => true, :anchor => "jump"), :notice => 'Товар успешно добавлен в корзину.' and return        
        end
      else
        format.html { render :action => "new" }
        format.json { render :json => @wish.errors, :status => :unprocessable_entity }
      end
    end
  end

  def multiple_delete
    Wish.guest_or_user(current_user, request.session_options[:id]).destroy_all(:id => params[:wishes_ids])
    redirect_to wishes_path(:anchor => "jump")
  end
  
  def multiple_update
    Wish.guest_or_user(current_user, request.session_options[:id]).update(params[:wishes].keys, params[:wishes].values)
    redirect_to wishes_path(:anchor => "jump")
  end
  
  def multiple_inactivate
    Wish.guest_or_user(current_user, request.session_options[:id]).where(:id => params[:wishes_ids]).update_all(:status => "inactive")
    redirect_to wishes_path(:anchor => "jump")
  end
  
  def multiple_activate
    Wish.guest_or_user(current_user, request.session_options[:id]).where(:id => params[:wishes_ids]).update_all(:status => "active")
    redirect_to wishes_path(:anchor => "jump")
  end  
  
  # # PUT /wishes/1
  # # PUT /wishes/1.json
  # def update
  #   @wish = Wish.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @wish.update_attributes(params[:wish])
  #       format.html { redirect_to @wish, :notice => 'Wish was successfully updated.' }
  #       format.json { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.json { render :json => @wish.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /wishes/1
  # DELETE /wishes/1.json
  #def destroy
  #  @wish = Wish.find(params[:id])
  #  @wish.destroy

  #  respond_to do |format|
  #    format.html { redirect_to wishes_url(:anchor => "jump") }
  #    format.json { head :ok }
  #  end
  #end
end
