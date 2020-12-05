class Recipe < ApplicationRecord
  has_many :layers
  has_many :glazes, through: :layers
end
