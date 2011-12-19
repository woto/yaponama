class PasswordsController < Devise::PasswordsController
  include SimpleCaptcha::ControllerHelpers
  
  def create
  
    self.resource = User.where(:phone => params[:user][:phone]).first
    
    if self.resource.blank?
      self.resource = resource_class.send_reset_password_instructions(params[resource_name])
      unless simple_captcha_valid?
        self.resource.errors[:phone].clear
        self.resource.errors.add(:captcha, "Неверно введен код")
        try_again and return
      end
    else
      unless simple_captcha_valid?
        self.resource.errors[:phone].clear
        self.resource.errors.add(:captcha, "Неверно введен код")
        try_again and return
      else
        self.resource = resource_class.send_reset_password_instructions(params[resource_name])
      end
    end
      
    if successfully_sent?(resource)
      respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
    else
      try_again
    end
  end
  
  protected

    def try_again
      respond_with_navigational(resource){ render_with_scope :new }
    end
    
    # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
      insert_confirmation_path
    end

end
