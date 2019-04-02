require 'rails_helper'

describe 'Managing students' do
  #let(:user) { FactoryBot.create(:user) }
  #before { login_as user }

  specify 'I should not be able to log in with the wrong details' do
    visit '/'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Username or password.'
  end

  specify 'I can log in' do
    visit '/'
    fill_in 'Username', with: 'aca17scf'
    fill_in 'Password', with: '123'
    allow_any_instance_of(User).to receive(:valid_ldap_authentication?).and_return(true)
    click_button 'Log in'
    expect(page).to have_content "Signed in successfully."
    expect(page).to_not have_content 'You need to sign in or sign up before continuing.'
  end

  specify 'I can go back to the Stations page' do
    click_button 'Back to Stations'
    expect(page).to have_current_path('/stations')
  end

  specify 'I can choose a student and start the examination' do
    let(:user) { FactoryBot.create(:user) }
    before { login_as user }
    visit '/'
    student1 = FactoryBot.create :student, forename: 'Student Name'
    expect(page).to have_content 'Student Name'
    click_button 'Start Examination'
    expect(page).to redirect_to '/'
  end


end
