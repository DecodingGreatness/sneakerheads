class User < ApplicationRecord
  has_many :sneakers, dependent: :destroy
end
