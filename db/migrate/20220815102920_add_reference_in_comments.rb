class AddReferenceInComments < ActiveRecord::Migration[7.0]
  def change
    def change
      add_reference :comments, :product
    end
  end
end
