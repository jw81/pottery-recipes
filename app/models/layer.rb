class Layer < ApplicationRecord
  belongs_to :recipe
  belongs_to :glaze

  COAT_TYPES = %w[bottom top]
end
