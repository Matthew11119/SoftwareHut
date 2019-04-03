require 'rails_helper'

describe 'Managing logins' do
  #let(:user) { FactoryBot.create(:user) }
  #before { login_as user }

  specify 'I should not be able to log in with the wrong username' do
    visit '/'
    fill_in 'Username', with: 'asdf'
    fill_in 'Password', with: '123'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Username or password.'
  end

  specify 'I should not be able to log in with the wrong password' do
    visit '/'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Username or password.'
  end

  specify 'I can log in with the correct details' do
    visit '/'
    fill_in 'Username', with: 'aca17scf'
    fill_in 'Password', with: '123'
    allow_any_instance_of(User).to receive(:valid_ldap_authentication?).and_return(true)
    click_button 'Log in'
    expect(page).to have_content "Signed in successfully."
    expect(page).to_not have_content 'You need to sign in or sign up before continuing.'
  end
end
