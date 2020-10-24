# Represents a Manufacturer object
class Manufacturer < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
end
