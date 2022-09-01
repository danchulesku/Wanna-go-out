class EventMailer < ApplicationMailer
  def subscription(subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = subscription.event

    mail to: @event.user.email, subject: "#{t(".subscription.subject")} #{@event.title}"
  end

  def comment(comment, email)
    @comment = comment
    @event = comment.event

    mail to: email, subject: "#{t(".comment.subject")} #{@event.title}"
  end

  def photos(new_photos, email)
    @photos = new_photos
    @event = new_photos.first.event

    mail to: email, subject: "#{t(".photos.subject")} #{@event.title}"
  end
end
