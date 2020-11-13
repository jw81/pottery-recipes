# Represent the Recipe model
FactoryBot.define do
  factory :recipe do
    cone { 1 }
    description { 'My Recipe Description' }
    name { 'My Recipe Name' }

    clays { build_list :clay, 1 }
    glazes { build_list :glaze, 1 }
  end
end
