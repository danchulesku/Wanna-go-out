class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_one_attached :source, dependent: :destroy
  validates :source, presence: true
  validate :correct_image_format?

  def correct_image_format?
    unless %w[image/jpg image/jpeg image/png].include?(self.source.content_type)
      self.errors.add("incorrect format")
    end
  end
end
