class CreateGlazes < ActiveRecord::Migration[6.0]
  def change
    create_table :glazes do |t|
      t.string :name
      t.string :brand_name

      t.timestamps
    end
  end
end
