class CreateJoinTableRecipesClays < ActiveRecord::Migration[6.0]
  def change
    create_join_table :recipes, :clays do |t|
      # t.index [:recipe_id, :clay_id]
      # t.index [:clay_id, :recipe_id]
    end
  end
end
