class ApplicationController < ActionController::Base
  include UsersHelper
  
  before_action :configure_device_parameters, if: :devise_controller?
  
  def configure_device_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :city_id])
  end
end