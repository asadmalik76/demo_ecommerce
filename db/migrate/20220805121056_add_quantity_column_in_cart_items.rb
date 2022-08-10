class AddQuantityColumnInCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :quantity, :int
  end
end
