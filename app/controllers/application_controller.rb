class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # ajout champs authentification devise (nickname, f-name, l-name)
  before_action :configure_permitted_parameters, if: :devise_controller?

  # redirecr after sign out pour devise
  def after_sign_out_path_for(resource_or_scope)
    profile_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name])
  end
end

