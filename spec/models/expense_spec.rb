require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.new(username:'anerlo', email:'anerlo@gmail.com', password:'123123') }
  let(:group) { Group.new(name:"Expense General", description: "An expense category", user_id: 1) }
  it 'is not valid without attributes' do
    expect(Expense.new).to_not be_valid
  end
  it 'is not valid without user_id' do
    expect(Expense.new(name: 'YouTube', amount: 2, group_id:1)).to_not be_valid
  end
  it 'is not valid without name' do
    expect(Expense.new(amount: 2, group_id:group.id, user_id: user.id)).to_not be_valid
  end
  it 'is not valid without amount' do
    expect(Expense.new(name: 'YouTube', group_id:group.id, user_id: user.id)).to_not be_valid
  end
  it 'is not valid without group_id' do
    expect(Expense.new(amount: 2, name: 'YouTube', user_id: user.id)).to_not be_valid
  end
  it 'is not valid without group_id' do
    expect(Expense.new(amount: 2, name: 'YouTube', user_id: user.id)).to_not be_valid
  end
  it 'is not valid with name less than 2 characters' do
    expect(Expense.new(amount: 2, name: 'Y', user_id: user.id)).to_not be_valid
  end
  it 'is not valid with name greater than 20 characters' do
    expect(Expense.new(amount: 2, name: '123456789012345678901', user_id: user.id)).to_not be_valid
  end
end
