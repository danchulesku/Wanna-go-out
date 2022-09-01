class PhotosController < ApplicationController
  before_action :user_can_add_photo?, only: :create
  before_action :set_event

  def create
    if params[:photos].nil?
      redirect_to @event, alert: "Вы не можете загрузить ноль фотогафий."
    else

      new_photos = []
      new_photos << params[:photos].map do |photo|
        new_photo = @event.photos.new(user: current_user)
        new_photo.source.attach(photo)
        new_photo.save
        new_photo
      end

      notify_subscribers(new_photos)
      redirect_to @event
    end
  end

  def notify_subscribers(new_photos)
    emails = (@event.subscribers.map(&:user_email) + [@event.user.email]) - [current_user.email]

    emails.each do |email|
      EventMailer.photos(@event, new_photos.first, email).deliver_now
    end
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
