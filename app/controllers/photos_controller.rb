class PhotosController < ApplicationController
  before_action :user_can_add_photo?, only: :create
  before_action :set_event

  def create
    if params[:photos].nil?
      redirect_to @event, alert: t("event_mailer.photos.error")
      return
    end

    new_photos = params[:photos].map do |photo|
      @event.photos.create(user: current_user, source: photo)
    end

    notify_subscribers(new_photos)
    redirect_to @event
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
