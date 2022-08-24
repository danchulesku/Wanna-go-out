class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  before_action :set_event, only: %i[ show ]
  before_action :set_current_user_event, only: %i[edit update destroy]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = current_user.events.build(event_params)

      if @event.save
        redirect_to event_url(@event), notice: I18n.t("controllers.events.created")
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
      if @event.update(event_params)
        redirect_to event_url(@event), notice: I18n.t("controllers.events.updated")
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    redirect_to events_url, notice: I18n.t("controllers.events.destroyed")
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_current_user_event
    @event = current_user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :description, :datetime)
  end
end
