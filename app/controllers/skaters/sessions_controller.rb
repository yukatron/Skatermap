# frozen_string_literal: true

class Skaters::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  def after_sign_in_path_for(resource)
    flash[:notice]="ログイン成功"
    root_path
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    added_attrs = [:name, :password]
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
