class Recipe < ApplicationRecord
  has_many :layers, dependent: :destroy
  belongs_to :clay
end
