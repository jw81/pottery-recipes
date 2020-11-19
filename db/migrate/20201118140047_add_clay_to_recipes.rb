class AddClayToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :clay, index: true
  end
end
