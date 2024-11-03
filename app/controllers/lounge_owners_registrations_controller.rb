# frozen_string_literal: true

class LoungeOwnersRegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def after_sign_up_path_for(_resource)
    # Add dashboard path for lounge owners
  end

  def after_update_path_for(_resource)
    # Add dashboard path for lounge owners
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name date_of_birth phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name date_of_birth phone_number])
  end
end
