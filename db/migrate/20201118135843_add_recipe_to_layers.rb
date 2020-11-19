class AddRecipeToLayers < ActiveRecord::Migration[6.0]
  def change
    add_reference :layers, :recipe, index: true
  end
end
