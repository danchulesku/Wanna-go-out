class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_current_user, except: [:show]

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
    @user = @current_user
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
      if @current_user.update(user_params)
        redirect_to user_url(@user), notice: I18n.t("controllers.user.update")
      else
        render :edit, status: :unprocessable_entity
      end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end

  def set_current_user
    @user = current_user
  end
end
