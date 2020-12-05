class CreateLayers < ActiveRecord::Migration[6.0]
  def change
    create_table :layers do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :glaze, null: false, foreign_key: true

      t.timestamps
    end
  end
end
