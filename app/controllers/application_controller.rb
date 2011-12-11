class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :upcase_token

  def upcase_token
    if params[:user]
      params[:user][:confirmation_token].upcase! if params[:user][:confirmation_token]
      params[:user][:reset_password_token].upcase! if params[:user][:reset_password_token]
    end
  end
end
