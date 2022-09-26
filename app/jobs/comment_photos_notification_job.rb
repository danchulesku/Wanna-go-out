class CommentPhotosNotificationJob < ApplicationJob
  queue_as :default

  #record - comment or photo
  def perform(event, record)
    notification_emails = (event.subscriptions.map(&:user_email) + [event.user.email]).uniq - [record.first&.user.email]
    notification_emails.each do |email|
      if record.first.class == Photo
        EventMailer.photos(record, email).deliver_later
      else
        EventMailer.comment(record.first, email).deliver_later
      end
    end
  end
end
