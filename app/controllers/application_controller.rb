class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :upcase_token

  helper_method :user_search_histories

  def upcase_token
    if params[:user]
      params[:user][:confirmation_token].upcase! if params[:user][:confirmation_token]
      params[:user][:reset_password_token].upcase! if params[:user][:reset_password_token]
    end
  end

  # Будет выполняться после входа пользователя (регистрация, вход, восстановление пароля)
  def after_sign_in_path_for(resource)
    SearchHistory.where(:session_id => request.session_options[:id]).update_all(:user_id => current_user.id, :session_id => nil)
    Wish.where(:session_id => request.session_options[:id]).update_all(:user_id => current_user.id, :session_id => nil)
    super
  end

  def user_search_histories
      SearchHistory.get_for(current_user, request.session_options[:id]).order("created_at DESC")
  end

  def user_wishes
    Wish.get_for(current_user, request.session_options[:id]).order("created_at DESC")
  end

end
