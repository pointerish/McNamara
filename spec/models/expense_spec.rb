require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:long_content) { (0...21).map { rand(65..90).chr }.join }
  it 'is not valid without attributes' do
    expect(Expense.new).to_not be_valid
  end
end