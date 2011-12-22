class ScreenWidthController < ApplicationController
  def index
    session[:screen_width] = params[:screen_width]
    render :nothing => true and return
  end
end
