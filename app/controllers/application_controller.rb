class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    attributes = %i[username email password time_zone]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end
end
