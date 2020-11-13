class CreateJoinTableRecipesGlazes < ActiveRecord::Migration[6.0]
  def change
    create_join_table :recipes, :glazes do |t|
      # t.index [:recipe_id, :glaze_id]
      # t.index [:glaze_id, :recipe_id]
    end
  end
end
