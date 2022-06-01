class Review < ApplicationRecord
  belongs_to :order, class_name: "Transaction", foreign_key: 'transaction_id'
end
