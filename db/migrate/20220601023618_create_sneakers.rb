class CreateSneakers < ActiveRecord::Migration[6.1]
  def change
    create_table :sneakers do |t|
      t.string :brand
      t.string :model
      t.integer :price
      t.integer :size
      t.string :condition

      t.timestamps
    end
  end
end
