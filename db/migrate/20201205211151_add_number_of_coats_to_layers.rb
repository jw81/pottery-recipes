class AddNumberOfCoatsToLayers < ActiveRecord::Migration[6.0]
  def change
    add_column :layers, :number_of_coats, :integer
  end
end
