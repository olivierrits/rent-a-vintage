class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # authenticate user only need when actually requesting a ride
  # wiating for the final name of the methods to be checked
  # before_action :authenticate_user! only: :home

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :license_number])
  end
end
