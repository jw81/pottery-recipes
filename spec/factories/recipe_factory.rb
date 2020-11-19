# Represent the Clay model
FactoryBot.define do
  factory :recipe do
    name { 'My Recipe Name' }
    description { 'My Recipe Description' }
    clay { build(:clay) }
  end
end
