class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :sneaker, null: false, foreign_key: true
      t.references :traded_sneaker, null: true, foreign_key: { to_table: :sneakers }
      t.references :buyer, null: false, foreign_key: { to_table: :users }
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.string :status
      t.datetime :datetime

      t.timestamps
    end
    # add_foreign_key :transactions, :sneakers, column: :traded_sneaker_id
    # add_foreign_key :transactions, :users, column: :buyer_id
    # add_foreign_key :transactions, :users, column: :seller_id
  end
end
