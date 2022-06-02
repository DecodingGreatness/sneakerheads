class SneakersController < ApplicationController

  def new
  end

  def create
    @sneaker = Sneaker.new(review_params)
    @user = User.find(paramsuser_id)
    @sneaker.user = @user
    @sneaker.save
    direct_to user_path(@user)
  end
end
