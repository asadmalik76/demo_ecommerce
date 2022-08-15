class DefaultValueInDiscountOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :discount, :float, default: 0.0
  end
end
