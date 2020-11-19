require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject { build(:recipe) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a brand_name' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
