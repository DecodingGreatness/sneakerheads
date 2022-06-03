class TransactionsController < ApplicationController

  def show
    @sneaker = Sneaker.find(params[:sneaker_id])
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
    @sneaker = Sneaker.find(params[:sneaker_id])
  end

  def create
    @transaction = Transaction.new(transaction_params)
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
