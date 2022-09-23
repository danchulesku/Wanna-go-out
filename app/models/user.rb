class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github, :google_oauth2]
  after_create :send_notification

  has_one_attached :avatar
  has_many :events
  has_many :comments, dependent: :destroy
  has_many :subscriptions

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, on: :create

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data["email"]).first

    user ||= User.create(
      email: data["email"],
      password: Devise.friendly_token[0, 20]
    )

    user.name = access_token.info.name
    grab_image_from_url(user, access_token.info.image)
    user.provider = access_token.provider
    user.uid = access_token.uid
    user.save

    user
  end

  private

  def self.grab_image_from_url(user, image_url)
    downloaded_image = URI.parse(image_url).open
    user.avatar.attach(io: downloaded_image  , filename: "avatar.jpeg")
  end

  def set_name
    self.name = "User №#{rand(10000)}" if self.name.blank?
  end

  def send_notification
    SignUpNotificationJob.perform_later(self)
  end
end
