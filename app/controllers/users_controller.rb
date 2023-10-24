class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    logger.debug "nickname: #{params[:user][:nickname]}"
    
    @user = User.new(sign_up_params)
    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :name, :nickname, :password, :password_confirmation)
  end

  def configure_permitted_parameters
    attributes = [:email, :name, :nickname, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end
end