class PasswordsController < Devise::PasswordsController
  include SimpleCaptcha::ControllerHelpers
  
  def create
  
    t = User.arel_table

    self.resource = User.where(
      t[:phone].eq(params[:user][:login]).
      or(t[:email].eq(params[:user][:login]))
    ).first
    
    debugger
    
    if self.resource.blank?

      unless simple_captcha_valid?
        self.resource = User.new
        self.resource.errors[:login].clear
        self.resource.errors.add(:captcha, "Неверно введен код")
        try_again and return
      else
        self.resource = User.new
        self.resource.errors[:login] = 'ааа'
      end
    else
      unless simple_captcha_valid?
        self.resource = User.new
        self.resource.errors[:phone].clear
        self.resource.errors.add(:captcha, "Неверно введен код")
        try_again and return
      else
        self.resource = resource_class.send_reset_password_instructions(params[resource_name])
      end
    end
      
    if successfully_sent?(self.resource)
      respond_with({}, :location => after_sending_reset_password_instructions_path_for(self.resource_name))
    else
      try_again
    end
  end
  
  protected

    def try_again
      respond_with_navigational(resource){ render :new }
    end
    
    # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
      insert_confirmation_path(:anchor => "jump")
    end

end
