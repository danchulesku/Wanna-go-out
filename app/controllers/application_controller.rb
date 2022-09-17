class ApplicationController < ActionController::Base
  include Pundit::Authorization
  # Настройка для работы Девайза, когда юзер правит профиль
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user_can_edit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:password, :password_confirmation, :current_password]
    )
  end

  def current_user_can_edit?(model)
    # Если у модели есть юзер и он залогиненный, пробуем у неё взять .event
    # Если он есть, проверяем его юзера на равенство current_user.
    user_signed_in? && (
      model.user == current_user ||
        (model.try(:event).present? && model.event.user == current_user)
    )
  end

  def pundit_user
    UserContext.new(current_user, params[:pincode], cookies)
  end

  private

  def user_not_authorized
    flash[:alert] = t("pundit.not_authorized")
    redirect_to(request.referrer || root_path)
  end
end

class UserContext
  attr_reader :user, :pincode, :cookies

  def initialize(user, pincode, cookies)
    @user = user
    @pincode = pincode
    @cookies = cookies
  end
end
