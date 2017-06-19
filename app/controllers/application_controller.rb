class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_filter :sanitize_divise_params
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  

  def index
    @gnl = General.all
  end

  def after_sign_in_path_for(resource)
    if resource.class == User
      settings_path
    elsif resource.class == AdminUser
      admin_dashboard_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  
  
end
