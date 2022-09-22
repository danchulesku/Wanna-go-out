class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event

  def create
    photos_sources = params[:photos]&.map { |photo| { user: current_user, source: photo } }
    photos = @event.photos.build(photos_sources)

    if @event.save
      message = { notice: I18n.t("events.show.photo.uploaded") }
      PhotoNotificationJob.perform_later(@event, photos)
    else
      message = { alert: I18n.t("events.show.photo.error.format") }
    end

    redirect_to @event, message
  end

  def destroy
    message = { notice: I18n.t("events.show.photo.message") }
    if current_user_can_edit?(@event)
      @event.photos.destroy_by(id: params[:id])
    else
      message = { alert: I18n.t("events.show.photo.error.uknown") }
    end

    redirect_to @event, message
  end

  private

  def check_nil
    if params[:photos].nil?
      redirect_to @event, alert: t("event_mailer.photos.errors.zero-photos")
    end
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
