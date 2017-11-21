class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_guest!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :photo_cache])
  end
end
