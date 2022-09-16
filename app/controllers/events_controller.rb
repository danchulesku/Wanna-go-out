class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  after_action :verify_authorized, except: [:show, :index, :new, :create]

  before_action :set_event, only: %i[show edit update destroy]
  #before_action :set_current_user_event, only: %i[edit update destroy]
  # @event = current_user.events.find(params[:id])
  before_action :pincode_quard, only: [:show]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
  end

  # GET /events/new
  def new
    @event = current_user.events.build
  end

  # GET /events/1/edit
  def edit
    authorize @event
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

  def pincode_quard
    return true if @event.pincode.blank?
    return true if signed_in? && current_user == @event.user

    if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
      cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
    end

    # Проверяем, верный ли в куках пин-код
    # Если нет — ругаемся и рендерим форму ввода пин-кода
    unless @event.pincode_valid?(cookies.permanent["events_#{@event.id}_pincode"])
      if params[:pincode].present?
        flash.now[:alert] = I18n.t('controllers.events.wrong_pincode')
      end
      render 'password_form'
    end
  end

  def event_params
    params.require(:event).permit(:title, :address, :description, :datetime, :pincode)
  end
end
