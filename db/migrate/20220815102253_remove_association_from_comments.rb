class RemoveAssociationFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :commentable, polymorphic: true
  end
end
