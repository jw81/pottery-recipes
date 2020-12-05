# Represents the Layer model
class Layer < ApplicationRecord
  belongs_to :recipe
  belongs_to :glaze

  COAT_TYPES = %w[bottom top].freeze
end
