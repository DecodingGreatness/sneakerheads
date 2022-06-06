class User < ApplicationRecord
  has_many :sneakers, dependent: :destroy
  has_many :transactions
  has_many :reviews, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def sales
    Transaction.where(seller: self)
  end

  def purchases
    Transaction.where(buyer: self)
  end
end
