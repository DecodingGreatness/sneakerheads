class ReviewsController < ApplicationController
  def new
    @transaction = Transaction.find(params[:transaction_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @transaction = Transaction.find(params[:transaction_id])
    @review.transaction_id = @transaction
    if @review.save
      redirect_to transaction_reviews(@transaction)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:buyer_content, :seller_content, :buyer_rating, :seller_rating)
  end
end
