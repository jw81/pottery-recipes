# Represents the Clay model
class Clay < ApplicationRecord
  validates_presence_of :brand_name
  validates_presence_of :description
  validates_presence_of :name

  has_and_belongs_to_many :recipes
end
