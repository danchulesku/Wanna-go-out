class PhotoNotificationJob < ApplicationJob
  queue_as :default

  def perform(photos)
    return if photos.nil?

    notification_emails(photos.first).each do |email|
      EventMailer.photos(photos, email).deliver_later
    end
  end
end
