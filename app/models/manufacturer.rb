# Represents a Manufacturer object
class Manufacturer < ApplicationRecord
  validates_presence_of :description
  validates_presence_of :name
end
