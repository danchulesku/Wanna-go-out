class CommentsController < ApplicationController
  before_action :set_event, only: %i[create destroy]
  before_action :set_comment, only: %i[destroy]

  # POST /comments or /comments.json
  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    if check_captcha(@new_comment) && @new_comment.save
      CommentPhotosNotificationJob.perform_later(@event, [@new_comment])
      redirect_to @event, notice: I18n.t("controllers.events.comments.created")
    else
      render "events/show", alert: I18n.t("controllers.events.comments.error")
    end

  end

  def destroy
    message = { notice: I18n.t("controllers.events.comments.destroyed") }

    if current_user_can_edit?(@comment)
      @comment.destroy!
    else
      message = { alert: I18n.t("controllers.events.comments.error") }
    end

    redirect_to @event, message
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = @event.comments.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def check_captcha(model)
    signed_in? || verify_recaptcha(model: model, error: t("recaptcha.error"))
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body, :user_name)
  end
end
