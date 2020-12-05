class AddCoatTypeToLayers < ActiveRecord::Migration[6.0]
  def change
    add_column :layers, :coat_type, :string
  end
end
