class AddReferenceInCartItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_items, :cart
    add_reference :cart_items, :product
  end
end
