class Layer < ApplicationRecord
  belongs_to :glaze
  belongs_to :recipe

  validates_presence_of :coat_type
end
