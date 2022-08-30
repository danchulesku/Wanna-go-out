class Event < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  has_many :comments, dependent: :destroy
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user

  validates :title, presence:  true, length: { maximum: 255 }
  validates :address, presence:  true
  validates :datetime, presence:  true
end
