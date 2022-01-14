class ApplicationController < ActionController::Base
  helper_method :is_admin?
  protect_from_forgery with: :exception
  before_action :authenticate_user! 

  before_action :configure_permitted_parameters, if: :devise_controller?

  def is_admin?
    current_user && current_user.admin
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password)}
    end 
end
