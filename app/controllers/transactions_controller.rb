class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
    @sneaker = Sneaker.find(params[:sneaker_id])
    @transaction = Transaction.find(params[:id])
    @review = Review.new

    @buyer = @transaction.buyer
    @seller = @transaction.seller
    @sneaker.user = @transaction.buyer
    end

  def new
    @transaction = Transaction.new
    @sneaker = Sneaker.find(params[:sneaker_id])
    @transaction.created_at = DateTime.now.in_time_zone("Asia/Singapore").strftime("%d/%m/%Y %H:%M")
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.created_at = DateTime.now.in_time_zone("Asia/Singapore").strftime("%d/%m/%Y %H:%M")
    @transaction.save!

    @sneaker = @transaction.sneaker
    @sneaker.user = @transaction.buyer
    @sneaker.save!

    redirect_to sneaker_transaction_path(@transaction.sneaker, @transaction)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:sneaker_id, :buyer_id, :seller_id)
  end

end
