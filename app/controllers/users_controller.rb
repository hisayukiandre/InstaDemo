class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = current_user
  end

  def update
  	user = current_user
  	user.update(user_params)
  	redirect_to user_path(user.id)
  end

  private

  def user_params
  	params.require(:user).permit(:user_name, :profile_image)
  end
end
