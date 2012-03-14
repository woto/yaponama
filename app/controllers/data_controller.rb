class DataController < ApplicationController
  def index
    session[:screen_width] = params[:screen_width]
    session[:screen_height] = params[:screen_height]
    session[:sent] = true
    render :nothing => true and return
  end
end
