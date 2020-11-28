class Recipe < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description

  has_many :layers, dependent: :destroy
  belongs_to :clay, optional: true

  accepts_nested_attributes_for :layers
end
