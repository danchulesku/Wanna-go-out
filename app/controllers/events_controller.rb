class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_event, only: %i[show edit update destroy]
  after_action :verify_authorized, except: [:index]
  after_action :verify_policy_scoped, only: [:index]

  # GET /events or /events.json
  def index
    @events = policy_scope(Event)
  end

  # GET /events/1 or /events/1.json
  def show
    if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
      cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
    end
    authorize @event
    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
  rescue Pundit::NotAuthorizedError
    flash.now[:alert] = I18n.t("controllers.events.wrong_pincode")
    render "password_form"
  end

  # GET /events/new
  def new
    @event = current_user.events.build
    authorize @event
  end

  # GET /events/1/edit
  def edit
    authorize @event
  end

  # POST /events or /events.json
  def create
    @event = current_user.events.build(event_params)
    authorize(@event)

    if @event.save
      redirect_to event_url(@event), notice: I18n.t("controllers.events.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    authorize @event

    if @event.update(event_params)
      redirect_to event_url(@event), notice: I18n.t("controllers.events.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    authorize @event

    @event.destroy
    redirect_to events_path, notice: I18n.t("controllers.events.destroyed")
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :description, :datetime, :pincode)
  end
end
