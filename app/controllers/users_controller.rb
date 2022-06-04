class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @user = User.find(params[:id])
    @sneakers = @user.sneakers
  end

  # def edit
  # end

  # def update
  #   @user.update(user_params)
  # end

  # def destroy
  #   @user.destroy
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # def user_params
  #   params.require(:user).permit(:id)
  # end
end
