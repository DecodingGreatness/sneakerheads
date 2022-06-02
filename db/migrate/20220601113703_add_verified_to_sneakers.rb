class AddVerifiedToSneakers < ActiveRecord::Migration[6.1]
  def change
    add_column :sneakers, :verified, :boolean, default: false
  end
end
