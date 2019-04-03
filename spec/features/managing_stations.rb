require 'rails_helper'

describe 'Managing stations' do
  let(:user) { FactoryBot.create(:user) }
  before { login_as user }

  specify 'I can create a new station' do
    allow_any_instance_of(User).to receive(:valid_ldap_authentication?).and_return(true)
    visit '/stations'
    click_link 'New Station'
    # fill_in 'exam_exam_code', with: 'EXAM123'
    # fill_in 'exam_name', with: 'Game of Thrones'
    #fill_in 'exam_module_code', with: 'TNR'
    click_button 'Create Station'
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
    expect(page).to have_current_path('/students')
  end
end
