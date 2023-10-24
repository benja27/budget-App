class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :allow_iframe


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private 

  def allow_iframe
    response.headers.except!('X-Frame-Options')
  end
end
