require 'rails_helper'

describe 'Choosing students' do
  # admin =  FactoryBot.create(:admin)

  specify 'I should not be able to log in with the wrong details' do
    #admin = FactoryBot.create(:admin)
    #allow(ApplicationController).to receive(:current_admin).and_return(admin)
    #login_as(admin)
    visit '/'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Username or password.'
  end

  specify 'I can log in' do
    visit '/'
    fill_in 'user_username', with: ''
    fill_in 'user_password', with: ''
    click_button 'Log in'
    expect(page).to have_content "Signed in successfully."
    expect(page).to_not have_content 'You need to sign in or sign up before continuing.'
  end


end
