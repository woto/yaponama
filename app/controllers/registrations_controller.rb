class RegistrationsController < Devise::RegistrationsController
  include SimpleCaptcha::ControllerHelpers

  def new
    # Chrome отправляет дополнительный запрос HEAD, который перегенеровывает капчу
    if request.method == 'GET'
      super
    else
      render :nothing => true
    end

  end

  # Делаем админом первого зарегистрировавшегося (копия оригинала без 2-х строк)
  def create
    build_resource

    # Первый зарегистрированный пользователь будет администратором
    if resource.class.count_by_sql("SELECT COUNT(id) FROM users") == 0
      resource.admin = true
    end

    if simple_captcha_valid?
      if resource.save
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_navigational_format?
          sign_in(resource_name, resource)
          respond_with resource, :location => after_sign_up_path_for(resource, :anchor => "jump")
        else
          set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
          expire_session_data_after_sign_in!
          respond_with resource, :location => after_inactive_sign_up_path_for(resource)
        end
      else
        try_again
      end
      
    else      
      self.resource.errors.add(:captcha, "Неверно введен код")
      self.resource.errors[:phone].clear
      
      try_again
    end
    
  end
  
  def try_again
    clean_up_passwords(resource)
    respond_with_navigational(resource) { render_with_scope :new }
  end  

  # To change this template use File | Settings | File Templates.
  def after_inactive_sign_up_path_for(resource)
    insert_confirmation_path(:anchor => "jump")
  end
  
  def after_update_path_for(resource)
    root_path(:anchor => "jump")
  end  
  
end
