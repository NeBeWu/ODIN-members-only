class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index; end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_back_or_to :root, notice: 'Profile was successfully updated.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:title, :bio, :location, :website, :birth)
  end
end
