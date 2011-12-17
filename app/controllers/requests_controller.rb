class RequestsController < ApplicationController
  before_filter :authenticate_user!

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.where(:user_id => current_user).includes(:messages)

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
    @request = Request.where(:id => params[:id]).includes(:messages => [:user, :message_assets]).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    @request = Request.new
    @request.car = Car.find(params[:car_id]) if params[:car_id]
    messages = @request.messages.build
    message_assets = messages.message_assets.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
    @request.messages[0].message_assets.build
  end

  # POST /requests
  # POST /requests.json
  def create
    set_user_on_nested_fields @request
    @request = Request.new(params[:request])

    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_path, :notice => 'Запрос был успешно создан, мы уведомим вас посредством SMS об ответе менеджера.' }
        format.json { render :json => @request, :status => :created, :location => @request }
      else
        format.html { render :action => "new" }
        format.json { render :json => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    @request = Request.find(params[:id])
    set_user_on_nested_fields @request

    respond_to do |format|
      if @request.update_attributes(params[:request])
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
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :ok }
    end
  end

  private

  def set_user_on_nested_fields(request)
    params[:request][:user_id] = current_user.id
    params[:request][:messages_attributes].each do |key, message|
      message[:user_id] = current_user.id
      message[:message_assets_attributes].each do |key, message_asset|
        message_asset[:user_id] = current_user.id
      end
    end
  end

end
