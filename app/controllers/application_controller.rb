class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :user_search_histories
  helper_method :item_status
  before_filter :set_user_is_session_admin_workaround

  def hide_or_show_catalog_number(item)
    if item['hide_catalog_number'] && !session[:admin_id] && !(current_user && current_user.admin?)
      item['catalog_number'] = view_context.link_to("Скрыт", "#", :rel => 'twipsy', :title => 'Каталожный номер скрыт, т.к. подбор осущствлял менеджер, цена (и в случае наличия скидки) сохранены.')
    else
      additional = {}
      if item['hide_catalog_number']
        additional = {:rel => 'twipsy', :title => "Каталожный номер от пользователя скрыт, т.к. подбор осущствлял менеджер, цена (и в случае наличия скидки) сохранены."}
      end
      item['catalog_number'] = view_context.link_to(item.catalog_number, search_searches_path(item.catalog_number, nil, :anchor => "jump"), additional)
    end
  end

  def item_status(catalog_number, manufacturer)

    status = {
      :own => {:status => 'unavaliable', :data => nil},
      :their => {:status => 'unavaliable', :data => nil}
    }

    # Наши данные
    spare_info = SpareInfo.where(:catalog_number => catalog_number, :manufacturer => manufacturer)

    if spare_info.present?
      status[:own][:status] = 'avaliable'
      status[:own][:data] = spare_info
    end

    key_part = "#{catalog_number}:#{manufacturer}".mb_chars.gsub(/[^а-яА-Яa-zA-z0-9]/,'_')

    # Их данные
    begin
      File.open("#{Rails.root}/system/parts_info/f:#{key_part}", "r") do |file|
        if (status[:their][:status] = file.read) == 'avaliable'
          File.open("#{Rails.root}/system/parts_info/s:#{key_part}", "r") do |file|
            status[:their][:data] = file.read
          end
        end
      end
    rescue Exception => exc
      if exc.instance_of? Errno::ENOENT
        status[:their][:status] = 'unknown'
      end

     if APP_CONFIG['send_request_from_search_page']
       require 'redis'
       redis = Redis.new(:host => APP_CONFIG["redis_address"], :port => APP_CONFIG["redis_port"])

       Juggernaut.publish(
       nil, {
         :command => 'info',
         :catalog_number => catalog_number,
         :manufacturer => manufacturer.presence || "WRONG_MANUFACTURER",
         :channel => 'server'
       }, {}, "custom")
      end

    end

    return status

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

protected

    # CKEDITOR разграничения файлов
    def ckeditor_filebrowser_scope(options = {})
      debugger
      super({ :assetable_id => current_user.id, :assetable_type => 'User' }.merge(options))
    end

    def ckeditor_pictures_scope(options = {})
      ckeditor_filebrowser_scope(options)
    end

    def ckeditor_attachment_files_scope(options = {})
      ckeditor_filebrowser_scope(options)
    end

    # Set current_user as assetable
    def ckeditor_before_create_asset(asset)
      asset.assetable = current_user
      return true
    end
    # /CKEDITOR разграничения файлов
  

  private


end
