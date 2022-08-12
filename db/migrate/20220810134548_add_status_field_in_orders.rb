class AddStatusFieldInOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :status, :int
  end
end
