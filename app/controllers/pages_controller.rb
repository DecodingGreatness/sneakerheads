class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @sneakers = Sneaker.all
    @transactions = Transaction.all
  end
end
