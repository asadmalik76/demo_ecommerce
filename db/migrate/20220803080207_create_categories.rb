class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.text :name
      t.string :slug
      t.timestamps
    end
  end
end
