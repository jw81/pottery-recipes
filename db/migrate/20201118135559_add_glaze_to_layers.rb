class AddGlazeToLayers < ActiveRecord::Migration[6.0]
  def change
    add_reference :layers, :glaze, index: true
  end
end
