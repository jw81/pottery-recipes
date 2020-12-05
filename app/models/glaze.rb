# Represents the Glaze model
class Glaze < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :brand_name
  validates_presence_of :product_number

  default_scope { order(name: :asc) }

  has_many :layers
  has_many :recipes, through: :layers
end
