class RequestsController < ApplicationController
  before_filter :authenticate_user!

  # GET /requests
  # GET /requests.json
  def index
    scope = Request.user_or_admin(current_user)
    scope = scope.order('updated_at DESC')
    
    @requests = scope.includes(:car).includes(:messages => :user).page params[:page]

    # Если нет ни одного запроса, то перекидываем 
    # к машинам с сохранением флэша
    unless @requests.present?
      flash.keep
      redirect_to cars_path and return
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    scope = Request.user_or_admin(current_user)    
    @request = scope.where(:id => params[:id]).includes(:messages => [:user, :message_assets]).first

    unless @request.present?
      redirect_to root_path(:anchor => "jump"), :notice => "Сообщение было удалено." and return
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new

    if params[:car_id]
      scope = Car.user_or_admin(current_user)
      car = scope.where(:id => params[:car_id]).first
      if car.present?
        @request.car = car
      else
        raise
      end
    end

    messages = @request.messages.build
    message_assets = messages.message_assets.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @request }
    end
  end

  # POST /requests
  # POST /requests.json
  def create
    set_user_on_nested_fields @request
    @request = Request.new(params[:request])    
    @request.user = current_user    

    respond_to do |format|
      if @request.save        
        format.html { redirect_to request_path(@request), :notice => 'Запрос был успешно создан, мы уведомим вас посредством SMS об ответе менеджера.' }
        format.json { render :json => @request, :status => :created, :location => @request }
      else
        format.html { render :action => "new" }
        format.json { render :json => @request.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    scope = Request
    scope = Request.user_or_admin(current_user)
    @request = scope.find(params[:id])
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    scope = Request.user_or_admin(current_user)

    @request = scope.find(params[:id])
    set_user_on_nested_fields @request
    
    respond_to do |format|
      if @request.update_attributes(params[:request])
        @request.touch
        format.html { redirect_to @request, :notice => 'Ответ был успешно отправлен, мы уведомим вас посредством SMS об ответе менеджера.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    scope = Request.user_or_admin(current_user)

    @request = scope.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :ok }
    end
  end

  private

  def set_user_on_nested_fields(request)
    params[:request][:messages_attributes].each do |key, message|
      message[:user_id] = current_user.id
      if message[:message_assets_attributes]
        message[:message_assets_attributes].each do |key, message_asset|
          message_asset[:user_id] = current_user.id
        end
      end
    end
  end

end
