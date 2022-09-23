class CommentNotificationJob < ApplicationJob
  queue_as :default

  def perform(comment)
    notification_emails(comment).each do |email|
      EventMailer.comment(comment, email).deliver_later
    end
  end
end
