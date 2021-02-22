require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without attributes' do
    expect(User.new).to_not be_valid
  end

  it 'is not valid without name' do
    expect(User.new(username: 'anerlo')).to_not be_valid
  end

  it 'is not valid without description' do
    expect(User.new(email: 'anerlo@gmail.com')).to_not be_valid
  end

  it 'is not valid without a well formed email' do
    expect(User.new(username: 'anerlo', email: 'anerlo@gmail..com')).to_not be_valid
  end
end
