class AddIndexToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_index :recipes, :category
  end
end
