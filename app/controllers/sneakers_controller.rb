class SneakersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @sneaker = Sneaker.all
  end

  def new
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    @user = User.find(user_id)
    @sneaker.user = @user
    @sneaker.save
    direct_to user_path(@user)
  end

  def show
    @sneaker = Sneaker.find(params[:id])
  end

  private

  def sneaker_params
    params.require(:sneaker).permit(:brand, :model, :price, :size, :condition)
  end

  # def set_sneaker
  #   @sneaker = Sneaker.find(params[:id])
  # end


end
