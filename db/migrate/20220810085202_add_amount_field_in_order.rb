class AddAmountFieldInOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :amount, :float
  end
end
