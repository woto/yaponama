class PasswordsController < Devise::PasswordsController

  protected

    # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
      insert_confirmation_path
    end

end
