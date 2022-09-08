class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    begin
      new_photos = params[:photos].map do |photo|
        @event.photos.create!(user: current_user, source: photo)
      end
    rescue
      message = {alert: I18n.t("events.show.photo.error.format")}
    end
    notify_subscribers(new_photos)
    redirect_to @event, message || {notice: I18n.t("events.show.photo.uploaded")}
  end

  def destroy
    message = { notice: I18n.t("events.show.photo.message") }
    if current_user_can_edit?(@event)
      @event.photos.destroy_by(id: params[:id])
    else
      message = {alert: I18n.t("events.show.photo.error.uknown")}
    end

    redirect_to @event, message
  end

  private

  def notify_subscribers(new_photos)
    return if new_photos.nil?
    emails = (@event.subscribers.map(&:email) + [@event.user.email]) - [new_photos.first.user.email]

    emails.each do |email|
      EventMailer.photos(new_photos, email).deliver_now
    end
  end

  def check_nil
    if params[:photos].nil?
      redirect_to @event, alert: t("event_mailer.photos.errors.zero-photos")
    end
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
