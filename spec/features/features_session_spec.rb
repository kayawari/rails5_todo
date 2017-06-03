require 'spec_helper'
require 'capybara/rspec'

feature 'session' do
  scenario 'sign in' do
    visit new_user_path
    fill_in 'user[name]', with: 'テスト太郎'
    fill_in 'user[email]', with: 'test@sample.com'
    fill_in 'user[password]', with: 'testpass'
    click_on 'Create New User'
    expect(page).to have_selector '.user-name', text: 'Name: テスト太郎'
    expect(page).to have_selector '.user-email', text: 'Email: test@sample.com'
  end
end

feature 'log' do
  given(:user) {
    User.create(
        name: 'テスト次郎',
        email: 'sample@sample.com',
        password: 'takayukikayawari'
    )
  }

  scenario 'in~out' do
    visit 'login'
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_on 'Log in'
    expect(page).to have_selector '.user-name', text: user.name
    expect(page).to have_selector '.user-email', text: user.email
    click_on 'Log out'
    expect(page).to have_selector '#session_email'
    expect(page).to have_selector '#session_password'
  end
end
