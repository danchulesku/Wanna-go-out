class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  with_options if: -> { user.present? } do
    validates :user, uniqueness: { scope: :event_id }
    validate :owner_signing
  end

  with_options unless: -> { user.present? } do
    validates :user_name, presence: true
    validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/
    validate :email_existence
    validates :user_email, uniqueness: { scope: :event_id }
  end
  # Проверки user_name и user_email выполняются,
  # только если user не задан
  # То есть для анонимных пользователей
  # Если есть юзер, выдаем его имя,
  # если нет – дергаем исходный метод
  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  # Если есть юзер, выдаем его email,
  # если нет – дергаем исходный метод
  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def owner_signing
    if event.user == user
      errors.add(:user, :is_owner, message: I18n.t("subscription.errors.self-owner"))
    end
  end

  def email_existence
    if User.where(email: user_email).present?
      errors.add(:user_email, :exist)
    end
  end
end
