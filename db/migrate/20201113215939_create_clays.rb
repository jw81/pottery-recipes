class CreateClays < ActiveRecord::Migration[6.0]
  def change
    create_table :clays do |t|
      t.string :name
      t.string :description
      t.string :brand_name

      t.timestamps
    end
  end
end
