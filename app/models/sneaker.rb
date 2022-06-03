class Sneaker < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  BRANDS = %w[Nike Addidas Puma NewBalance Reebok]
end
