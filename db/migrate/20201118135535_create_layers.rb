class CreateLayers < ActiveRecord::Migration[6.0]
  def change
    create_table :layers do |t|

      t.timestamps
    end
  end
end
