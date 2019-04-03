require 'rails_helper'

describe 'Managing students' do
  let(:user) { FactoryBot.create(:user) }
  before { login_as user }

  specify 'I can create a new exam' do
    allow_any_instance_of(User).to receive(:valid_ldap_authentication?).and_return(true)
    visit '/exams'
    click_link 'New Exam'
    fill_in 'exam_exam_code', with: 'EXAM123'
    fill_in 'exam_name', with: 'Game of Thrones'
    fill_in 'exam_module_code', with: 'TNR'
    select '3', :from => 'exam_date_3i'
    select 'April', :from => 'exam_date_2i'
    select '2019', :from => 'exam_date_1i'
    click_button 'Create Student'
    expect(page).to have_content('Exam was successfully created')
    expect(page).to have_content('EXAM123')
    expect(page).to have_content('Game of Thrones')
    expect(page).to have_content('TNR')
    expect(page).to have_content('3 April 2019')
  end

  specify 'I can view all upcoming exams' do
    allow_any_instance_of(User).to receive(:valid_ldap_authentication?).and_return(true)
    upcomingexam = FactoryBot.create :exam, exam_code: 'COMU05', module_code: 'COM1234', name: 'CompSci', date: '19/03/2020'
    visit '/exams'
    expect(page).to have_content('COMU05')
  end

  specify 'I can select an exam' do
    allow_any_instance_of(User).to receive(:valid_ldap_authentication?).and_return(true)
    visit '/exams'
    click_link 'Select'
    expect(page).to have_current_path('/stations')
  end

  specify 'I can log out' do
    allow_any_instance_of(User).to receive(:valid_ldap_authentication?).and_return(true)
    click_button 'Log Out'
    expect(page).to have_current_path('/user/sign_in')
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  # I can view all exams for the day

end
