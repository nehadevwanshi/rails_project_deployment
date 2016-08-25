require 'rails_helper'
RSpec.describe 'updating user' do
  it 'updates user and redirects to profile page' do
    user = create_user
    log_in user
    puts "user data #{user.password}"
    expect(page).to have_text('kobe')
    click_link 'Edit Profile'
    fill_in 'name', with: 'drake'
    #fill_in 'email', with: 'drake@lakers.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Update'
    expect(page).not_to have_text('kobe')
    expect(page).to have_text('drake')
    #expect(page).not_to have_text('kobe@lakers.com')
    #expect(page).to have_text('drake@lakers.com')
  end
end