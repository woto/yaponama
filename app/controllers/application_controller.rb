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

  def after_sign_in_path_for(resource)
    SearchHistory.where(:session_id => request.session_options[:id]).update_all(:user_id => current_user.id)
    Wish.where(:session_id => request.session_options[:id]).update_all(:user_id => current_user.id)
    super
  end

  def user_search_histories
    if current_user
      SearchHistory.where(:user_id => current_user.id).order("created_at DESC")
    else
      SearchHistory.where(:session_id => request.session_options[:id]).order("created_at DESC")
    end
  end

  def user_wishes
    if current_user
      Wish.where(:user_id => current_user.id).order("created_at DESC")
    else
      Wish.where(:session_id => request.session_options[:id]).order("created_at DESC")
    end
  end

end
