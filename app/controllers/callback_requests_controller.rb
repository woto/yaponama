class CallbackRequestsController < ApplicationController

  before_filter :is_admin?, :only => [:edit, :index, :show, :update, :destroy]

  def index
    @callback_requests = CallbackRequest.order("id desc").page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @callback_requests }
    end
  end

  def show
    @callback_request = CallbackRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @callback_request }
    end
  end

  def edit
    @callback_request = CallbackRequest.find(params[:id])
    respond_to do |format|
      format.html
    end
  end


  def update
    @callback_request = CallbackRequest.find(params[:id])

    respond_to do |format|
      if @callback_request.update_attributes(params[:callback_request])
        format.html { redirect_to @callback_request, :notice => 'Заявка обратного вызова успешно обновлена' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @callback_request.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @callback_request = CallbackRequest.find(params[:id])
    @callback_request.destroy

    respond_to do |format|
      format.html { redirect_to callback_requests_url }
      format.json { head :ok }
    end
  end

  def please
    @callback_request = CallbackRequest.new(params[:callback_request])
    if @callback_request.valid?
      session[:callback_request] = params[:callback_request]
      @manager_free_time = Block.where(:block_name => "manager_free_time").first.content
      if @manager_free_time.present?
        respond_to do |format|
          format.js {render :confirm_required}
          format.mobile {render :confirm_required}
          format.html {render :confirm_required}
        end
      else
        thanks
      end
    else
      call_me
    end
  end


  def sorrow
    respond_to do |format|
      format.js { render :js => "$('#callback_request_block').html('#{view_context.escape_javascript(render_to_string(:partial => "common_sorrow"))}');" }
      format.mobile { render :sorrow }
    end
  end

  def thanks
    @callback_request = CallbackRequest.new(session[:callback_request])

    if @callback_request.save
      respond_to do |format|
        format.js { render :js => "$('#callback_request_block').html('#{view_context.escape_javascript(render_to_string(:partial => 'common_thanks'))}');" }
        format.mobile {render "thanks"}
      end
    else
      call_me
    end
  end

  def call_me
    respond_to do |format|
      format.js {render :js => "$('#callback_request_block').html('#{view_context.escape_javascript(render_to_string(:partial => 'call_me'))}');"}
      format.mobile {render "call_me"}
      format.html {render "call_me"}
    end
  end

end
