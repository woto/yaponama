class RegistrationsController < Devise::RegistrationsController
  # To change this template use File | Settings | File Templates.
  def after_inactive_sign_up_path_for(resource)
    insert_confirmation_path
  end
end