# Represents the Recipe model
class Recipe < ApplicationRecord
  validates_presence_of :cone
  validates_presence_of :description
  validates_presence_of :name
  validates :clays, presence: true
  validates :glazes, presence: true

  has_and_belongs_to_many :clays
  has_and_belongs_to_many :glazes
end
