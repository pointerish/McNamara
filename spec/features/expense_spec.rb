require 'rails_helper'

RSpec.describe 'Expense', type: :feature do
  scenario 'User is able to create expense' do
    User.create(username: 'anerlo', email: 'anerlo@gmail.com', password: '123123')
    visit root_path
    fill_in 'user_email', with: 'anerlo@gmail.com'
    fill_in 'user_password', with: '123123'
    click_on 'Log in'
    sleep(2)
    visit '/expenses/new'
    fill_in 'Name', with: 'Chess'
    fill_in 'Amount', with: '200'
    click_on 'Create'
    sleep(2)
    expect(page).to have_content('Chess')
  end

  scenario 'User is able to delete expense' do
    User.create(username: 'anerlo', email: 'anerlo@gmail.com', password: '123123')
    visit root_path
    fill_in 'user_email', with: 'anerlo@gmail.com'
    fill_in 'user_password', with: '123123'
    click_on 'Log in'
    sleep(2)
    visit '/expenses/new'
    fill_in 'Name', with: 'Chess'
    fill_in 'Amount', with: '200'
    click_on 'Create'
    sleep(2)
    click_on 'Delete'
    expect(page).not_to have_content('Chess')
  end
end