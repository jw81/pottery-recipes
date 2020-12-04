class AddProductNumberToGlazes < ActiveRecord::Migration[6.0]
  def change
    add_column :glazes, :product_number, :string
  end
end
