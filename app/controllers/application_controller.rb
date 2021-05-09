class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller? 
  
  
  def set_q_for_room
    @q = Room.ransack(params[:q])
  end
  
  # strong parametersを設定し、nameを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit(:name,:email, :password, :password_confirmation)
      end
    
    devise_parameter_sanitizer.permit(:sign_in) do|u|
        u.permit(:name, :email, :password, :remember_me)
    end
    
  end
end
