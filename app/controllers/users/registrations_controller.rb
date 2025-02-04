# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
    resource.soft_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

# private
# def user_params
#   params.require(:user).permit(:name, :birthday, :email, :password, :gender, :stature, :blood, :figure, image_names: []).merge(user_id: current_user.id)
# end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:gender])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :email, :password, :stature, :blood, :figure, :prefecture_id, :birthplace_id, :self_pr, :brother, :study, :job, :money, :marriage, :children, :intention,  :housework, :hope, :housemate, :holiday, :liquor, :tobacco, :like, image_names: []])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end
  
    def after_update_path_for(resource)
      user_path(current_user)
    end 
  
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  
  
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   user_index_path_path
  # end
end
