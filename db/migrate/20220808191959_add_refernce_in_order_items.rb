class AddRefernceInOrderItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_items, :order
    add_reference :order_items, :product
  end
end
