# Represents the Glaze model
class Glaze < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :brand_name
end
