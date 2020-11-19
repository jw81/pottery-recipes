class Recipe < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description

  has_many :layers, dependent: :destroy
  belongs_to :clay
end
