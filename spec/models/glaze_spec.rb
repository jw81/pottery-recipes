require 'rails_helper'

RSpec.describe Glaze, type: :model do
  subject { build(:glaze) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a brand_name' do
    subject.brand_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a product_number' do
    subject.product_number = nil
    expect(subject).to_not be_valid
  end
end
