# Represents the Clay model
class Clay < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :brand_name

  has_many :recipes
end
