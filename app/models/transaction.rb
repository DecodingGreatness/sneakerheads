class Transaction < ApplicationRecord
  belongs_to :sneaker
  belongs_to :traded_sneaker, class_name: "Sneaker", optional: true
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  has_one :review
end
