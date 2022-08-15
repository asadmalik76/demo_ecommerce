class AddDiscountColumnInOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :discount, :float
  end
end
