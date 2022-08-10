class AddColumnInCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :session_id, :integer
    add_reference :carts, :user
  end
end
