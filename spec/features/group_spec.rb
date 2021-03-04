require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  scenario 'User is able to create groups' do
    User.create(username: 'anerlo', email: 'anerlo@gmail.com', password: '123123')
    visit root_path
    fill_in 'user_email', with: 'anerlo@gmail.com'
    fill_in 'user_password', with: '123123'
    click_on 'Log in'
    sleep(2)
    visit '/groups/new'
    fill_in 'Name', with: 'Chess'
    fill_in 'Description', with: 'Chess Related Expenses'
    click_on 'Create'
    sleep(2)
    visit '/groups'
    expect(page).to have_content('Chess')
  end
end
