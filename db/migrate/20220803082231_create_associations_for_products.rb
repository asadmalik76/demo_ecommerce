class CreateAssociationsForProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :category
    add_reference :products, :brand
    add_reference :products, :user
  end
end
