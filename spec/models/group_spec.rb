require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is not valid without attributes' do
    expect(Group.new).to_not be_valid
  end

  it 'is not valid without name' do
    expect(Group.new(description: 'Test!')).to_not be_valid
  end

  it 'is not valid without description' do
    expect(Group.new(name: 'Test!')).to_not be_valid
  end
end
