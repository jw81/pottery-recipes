require 'rails_helper'

RSpec.describe Layer, type: :model do
  subject { build(:layer) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a coat_type' do
    subject.coat_type = nil
    expect(subject).to_not be_valid
  end

end
