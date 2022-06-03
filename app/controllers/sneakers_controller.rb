class SneakersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @sneaker = Sneaker.all
  end

  def new
    @sneaker = Sneaker.new

    @user = User.find(params[:user_id])
  end

  def show
    @sneaker = Sneaker.find(params[:id])
  end

  def brand
    @brands = Sneaker.where(brand: params[:brand_name])
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    @user = User.find(params[:user_id])
    @sneaker.user = @user
    if @sneaker.save
     redirect_to user_sneaker_path(@user, @sneaker)
    else
      render :new
    end
  end

  # I need to filter sneakers by price

  # sneakers.price

  # I need to filter sneakers by size

# sneakers.size

  # I need to filter sneakers by brand

# sneakers.brand




  private

  def sneaker_params
    params.require(:sneaker).permit(:brand, :model, :price, :size, :condition, :user_id, photos: [])
  end
end
