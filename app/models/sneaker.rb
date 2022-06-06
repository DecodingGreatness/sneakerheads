class Sneaker < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  BRANDS = %w[Nike Adidas Puma NewBalance Reebok]
end
