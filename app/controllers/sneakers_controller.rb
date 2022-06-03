class SneakersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    if params[:query].present?
      @sneaker = Sneaker.where(brand: params[:query])
    else
      @sneaker = Sneaker.all
    end
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
    # @user = @brand.user_id
    # @sneaker = @brand
    # raise
    # @sneaker = Sneaker.find(params[:id])
    # @user = User.find(params[:user_id])
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

  private

  def sneaker_params
    params.require(:sneaker).permit(:brand, :model, :price, :size, :condition, :user_id, photos: [])
  end
end
