# Represents the Recipe model
class Recipe < ApplicationRecord
  has_many :layers, inverse_of: :recipe
  has_many :glazes, through: :layers
  accepts_nested_attributes_for :layers, reject_if: :all_blank, allow_destroy: true
end
