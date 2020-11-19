# Represent the Layer model
FactoryBot.define do
  factory :layer do
    coat_type { 'My Layer Coat Type' }
    recipe { build(:recipe) }
    glaze { build(:glaze) }
  end
end
