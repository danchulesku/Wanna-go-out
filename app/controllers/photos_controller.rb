class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    if params[:photos].nil?
      redirect_to @event, alert: t("event_mailer.photos.errors.zero-photos")
      return
    end

    new_photos = params[:photos].map do |photo|
      unless correct_image_format?(photo)
        redirect_to @event, alert: t("event_mailer.photos.errors.format")
        return
      end
      @event.photos.create(user: current_user, source: photo)
    end

    notify_subscribers(new_photos)
    redirect_to @event
  end

  def destroy
    message = {notice: I18n.t("events.show.photo.message")}
    unless @event.photos.destroy_by(id: params[:id])
      message = I18n.t("events.show.photo.error")
    end

    redirect_to @event, message
  end

  def notify_subscribers(new_photos)
    emails = (@event.subscribers.map(&:email) + [@event.user.email]) - [new_photos.first.user.email]

    emails.each do |email|
      EventMailer.photos(new_photos, email).deliver_now
    end
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
