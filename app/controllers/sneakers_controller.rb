class SneakersController < ApplicationController

  def new
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    @user = User.find(user_id)
    @sneaker.user = @user
    @sneaker.save
    direct_to user_path(@user)
  end

  private

  def sneaker_params
    params.require(:sneaker).permit(:model, :price, :size, :condition)
  end

end
