# app/controllers/confirmations_controller.rb
class ConfirmationsController < Devise::PasswordsController
  # Remove the first skip_before_filter (:require_no_authentication) if you
  # don't want to enable logged users to access the confirmation page.
  skip_before_filter :require_no_authentication
  skip_before_filter :authenticate_user!

  def create

    self.resource = resource_class.send_confirmation_instructions(params[resource_name])
    #self.resource = resource_class.send_reset_password_instructions(params[resource_name])
    #
    #if successfully_sent?(resource)
    #  respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
    #else
    #  respond_with_navigational(resource){ render_with_scope :new }
    #end
    if successfully_sent?(resource)
      set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
      expire_session_data_after_sign_in!
      respond_with resource, :location => after_inactive_sign_up_path_for(resource)
    else
      respond_with_navigational(resource){ render_with_scope :new }
    end
  end

  # The path used after sign up for inactive accounts. You need to overwrite
  # this method in your own RegistrationsController.
  def after_inactive_sign_up_path_for(resource)
    root_path
  end

  # PUT /resource/confirmation
  def update
    with_unconfirmed_confirmable do
      if @confirmable.has_no_password?
        @confirmable.update_attributes(params[:user])
        if @confirmable.valid?
          do_confirm
        else
          do_show
          @confirmable.errors.clear #so that we wont render :new
        end
      else
        self.class.add_error_on(self, :email, :password_allready_set)
      end
    end

    if !@confirmable.errors.empty?
      render_with_scope :new
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    with_unconfirmed_confirmable do
      if @confirmable.has_no_password?
        do_show
      else
        do_confirm
      end
    end
    if !@confirmable.errors.empty?
      render_with_scope :new
    end
  end
  
  protected

  # Returns the inactive reason translated.
  def inactive_reason(resource)
    reason = "bla"
    I18n.t("devise.registrations.reasons.#{reason}", :default => reason)
  end

  def with_unconfirmed_confirmable
    @confirmable = User.find_or_initialize_with_error_by(:confirmation_token, params[:confirmation_token])
    if !@confirmable.new_record?
      @confirmable.only_if_unconfirmed {yield}
    end
  end

  def do_show
    @confirmation_token = params[:confirmation_token]
    @requires_password = true
    self.resource = @confirmable
    render_with_scope :show
  end

  def do_confirm
    @confirmable.confirm!
    set_flash_message :notice, :confirmed
    sign_in_and_redirect(resource_name, @confirmable)
  end
end
