class Event < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos, dependent: :destroy

  validates :title, presence:  true, length: { maximum: 255 }
  validates :address, presence:  true
  validates :datetime, presence:  true

  def pincode_valid?(pin2check)
    pincode == pin2check
  end

  def background_image
    if photos.any?
      photos.sample.source.url
    else
      images = Dir.entries("app/assets/images/default_event_backgrounds/") -%w[. ..]
      "default_event_backgrounds/#{images.sample}"
    end
  end
end
