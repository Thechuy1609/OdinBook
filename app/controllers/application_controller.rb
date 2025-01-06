class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :full_name, :email, :encrypted_password ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :email, :password, :password_confirmation])
  end

 private

  def record_not_found
        redirect_to root_path, alert: "The resource you were looking for could not be found."
  end
end
