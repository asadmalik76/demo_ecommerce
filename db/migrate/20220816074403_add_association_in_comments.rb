class AddAssociationInComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :product
  end
end
