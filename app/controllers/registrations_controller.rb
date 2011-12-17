class RegistrationsController < Devise::RegistrationsController

  # Делаем админом первого зарегистрировавшегося (копия оригинала без 2-х строк)
  def create

    build_resource

    if resource.class.count_by_sql("SELECT COUNT(id) FROM users") == 0
      resource.admin = true
    end

    if resource.save_with_captcha
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render_with_scope :new }
    end

  end

  # To change this template use File | Settings | File Templates.
  def after_inactive_sign_up_path_for(resource)
    insert_confirmation_path
  end
end
