# Represents the Clay model
class Clay < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :brand_name
end
