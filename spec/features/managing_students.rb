require 'rails_helper'

describe 'Managing students' do
  let(:user) { FactoryBot.create(:user) }
  before { login_as user }

  specify 'I can go back to the Stations page' do
    allow_any_instance_of(User).to receive(:valid_ldap_authentication?).and_return(true)
    visit '/'
    click_button 'Back to Stations'
    expect(page).to have_current_path('/stations')
  end

  specify 'I can create a new student' do
    allow_any_instance_of(User).to receive(:valid_ldap_authentication?).and_return(true)
    visit '/'
    click_link 'Add New Student'
    fill_in 'student_student_id', with: '1234'
    fill_in 'student_forename', with: 'Jon'
    fill_in 'student_surname', with: 'Targaryen'
    fill_in 'student_regno', with: '1111'
    click_button 'Create Student'
    expect(page).to have_content('Student was successfully created')
    expect(page).to have_content('1234')
    expect(page).to have_content('Jon')
    expect(page).to have_content('Targaryen')
    expect(page).to have_content('1111')
  end

  specify 'I can view a list of students who have not been examined' do
    allow_any_instance_of(User).to receive(:valid_ldap_authentication?).and_return(true)
    jonstark = FactoryBot.create :student, forename: 'Jon', surname: 'Stark', regno: '1234', student_id: '1111'
    # jonstark = Student.create(forename: 'Jon' surname: 'Stark' regno: '1234' student_id: '1111')
    visit '/'
    click_link 'Remaining'
    expect(page).to have_current_path('/students')
    expect(page).to have_content('There are 1 students to be examined')
    expect(page).to have_content('1234')
    expect(page).to have_content('Jon')
    expect(page).to have_content('Stark')
    expect(page).to have_content('1111')
  end

  specify 'I can view a list of examined students' do
    allow_any_instance_of(User).to receive(:valid_ldap_authentication?).and_return(true)
    jonsnow = FactoryBot.create :student, forename: 'Jon', surname: 'Stark', regno: '1234', student_id: '1111'
    visit '/'
    # assess the student
    click_link 'Completed'
    expect(page).to have_current_path '/students/show_examined'
    expect(page).to have_content 'There are 0 students that have completed their examination'
  end

  specify 'I can search for a specific student by his/her surname' do
    allow_any_instance_of(User).to receive(:valid_ldap_authentication?).and_return(true)
    jonsnow = FactoryBot.create :student, forename: 'Jon', surname: 'Stark', regno: '1234', student_id: '1111'
    jonstark = FactoryBot.create :student, forename: 'Jon', surname: 'Stark', regno: '1234', student_id: '1111'
    visit '/'
    fill_in 'Surname', with: 'Stark'
    click_button 'Search'
    expect(page).to have_content('Stark')
    expect(page).to_not have_content('Snow')
  end

  # specify 'I can examine a student'
  # specify 'I can edit a completed student's exam script'

end
