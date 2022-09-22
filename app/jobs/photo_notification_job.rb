class PhotoNotificationJob < ApplicationJob
  queue_as :default

  def perform(event, photos)
    return if photos.nil?
    emails = (event.subscribers.map(&:email) + [event.user.email]) - [photos.first.user.email]

    emails.each do |email|
      EventMailer.photos(photos, email).deliver_later
    end
  end
end
