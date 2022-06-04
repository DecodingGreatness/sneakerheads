class TransactionsController < ApplicationController

  def show
    @sneaker = Sneaker.find(params[:sneaker_id])
    @transaction = Transaction.find(params[:id])

    @buyer = @transaction.buyer
    @seller = @transaction.seller
    @sneaker.user = @transaction.buyer
    end

  def new
    @transaction = Transaction.new
    @sneaker = Sneaker.find(params[:sneaker_id])
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.datetime = Datetime.now
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
