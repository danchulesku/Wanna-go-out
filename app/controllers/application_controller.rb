class ApplicationController < ActionController::Base
  # Настройка для работы Девайза, когда юзер правит профиль
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user_can_edit?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:password, :password_confirmation, :current_password]
    )
  end

  def current_user_can_edit?(event)
    signed_in? && current_user == event.user
  end
  private
  # Overwriting the sign_out redirect path method
  #def after_sign_up_path_for(resource_or_scope)
  #  root
  #end

end
