class ApplicationController < ActionController::API
  
  # skip_before_action :verify_authenticity_token
  include DeviseTokenAuth::Concerns::SetUserByToken
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  # end
  
  private

  def check_admin!
    unless current_api_app_user.admin?
      render json: { errors: ['You are not authorized to perform this action'] }, status: :unauthorized
    end
  end
      
end
