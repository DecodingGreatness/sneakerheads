class ReviewsController < ApplicationController
  def new
    @transaction = Transaction.find(params[:transaction_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @user = User.find[:user_id]
    @review.user = @user
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
