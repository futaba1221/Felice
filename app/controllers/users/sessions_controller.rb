# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
  before_action :reject_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  def after_sign_in_path_for(resource)
    users_path
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
    def reject_user
      @user = User.find_by(email: params[:user][:email].downcase)
      if @user.status == true
          flash[:notice] = "あなたは退会済みのユーザーです。"
          redirect_to ("/users/#{@user.id}/reregistration")
      end
      
      
    end
  
end
