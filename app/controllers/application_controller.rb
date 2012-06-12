class ApplicationController < ActionController::Base
  
  before_filter :force_change_mobile
  
  protect_from_forgery

  respond_to_mobile_requests
  
  before_filter :upcase_token

  helper_method :user_search_histories

  helper_method :item_status

  before_filter :set_user_is_session_admin_workaround

  def set_user_is_session_admin_workaround
    User.is_session_admin_workaround  = session[:admin_id] || (current_user && current_user.admin?)
  end

  def is_admin?
    unless current_user && current_user.admin?
      redirect_to root_path, :notice => "Вы не администратор"
    end
  end

  def item_status(catalog_number, manufacturer)

    status = {
      :own => nil, 
      :their => nil
    }

    page = Page.where(:path => info_path(catalog_number, manufacturer)[1..-1]).first
    if page.present?
      status[:own] = 'avaliable'
    end

    key_part = "#{catalog_number}:#{manufacturer}".mb_chars.gsub(/[^а-яА-Яa-zA-z0-9]/,'_')

    begin
      File.open("#{Rails.root}/system/parts_info/f:#{key_part}", "r") do |file|
        status[:their] = file.read
      end
    rescue Exception => exc
      if exc.instance_of? Errno::ENOENT
        status[:their] = 'unknown'
      end
    end

    return status

  end

  def upcase_token
    if params[:user]
      params[:user][:confirmation_token].upcase! if params[:user][:confirmation_token]
      params[:user][:reset_password_token].upcase! if params[:user][:reset_password_token]
    end
  end

  # Будет выполняться после входа пользователя (регистрация, вход, восстановление пароля)
  def after_sign_in_path_for(resource)
    SearchHistory.where(:session_id => request.session_options[:id]).update_all(:user_id => current_user.id, :session_id => nil)
    
    #old_wishes = Wish.where(:user_id => current_user.id).where("status = 'active' OR status = 'inactive'")
    #new_wishes = Wish.where(:session_id => request.session_options[:id])
    #old_wishes.each do |old_wish|
    #  new_wishes.each do |new_wish|
    #    if ( old_wish[:cost] == new_wish[:cost] ) &&
    #      ( old_wish[:catalog_number] == new_wish[:catalog_number] ) && 
    #      ( old_wish[:manufacturer] == new_wish[:manufacturer] ) && 
    #      ( old_wish[:title] == new_wish[:title] ) && 
    #      ( old_wish[:count] == new_wish[:count] ) && 
    #      ( old_wish[:declared] == new_wish[:declared] ) && 
    #      ( old_wish[:average] == new_wish[:average] ) && 
    #     ( old_wish[:country] == new_wish[:country] )
    #     
    #     old_wish[:count_in_wishes] += new_wish[:count_in_wishes]
    #     old_wish[:status] = new_wish[:status]
    #     old_wish.save
    #     new_wish.destroy
    #   end
    # end
    #end

    Wish.where(:session_id => request.session_options[:id]).update_all(:user_id => current_user.id, :session_id => nil)
    super
  end

  def user_search_histories
    SearchHistory.guest_or_user(current_user, request.session_options[:id]).order("created_at DESC")
  end

  def user_wishes
    Wish.guest_or_user(current_user, request.session_options[:id]).order("created_at DESC")
  end

  def force_change_mobile
    if params[:skip_mobile] == 'false'
      session[:mobylette_override] = :force_mobile
    elsif params[:skip_mobile] == 'true'
      session[:mobylette_override] = :ignore_mobile
    end
  end

  # Хочу сюда дописать anchor
  #def after_sign_in_path_for(resource_or_scope)
  #
  #end

  def after_sign_out_path_for(resource_or_scope)
    root_path(:anchor => "jump")
  end  
  
end
