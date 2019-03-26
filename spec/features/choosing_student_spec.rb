require 'rails_helper'

describe 'Choosing students' do
  specify 'I can see the station & module that I have previously selected' do
    expect(page).to have_content 'Title'
    expect(page).to have_content 'Module Code'
  end

  specify 'I can choose a student and start the examination' do
    student1 = FactoryBot.create :student, name: 'Student Name'
    expect(page).to have_content 'Student Name'
    click_button 'Start Examination'
    expect(page).to redirect_to '/'
  end

  specify 'I can view a previously examined student script' do
    student1 = FactoryBot.create :student, name: 'Student Name'
    expect(page).to have_content 'Student Name'
    click_button 'Start Examination'
    expect(page).to redirect_to '/'
  end

  specify 'I can add a new student' do
    click_button 'Add New Student'
    fill_in 'Student', with: '1457'
    fill_in 'Forename', with: 'First'
    fill_in 'Surname', with: 'Last'
    fill_in 'Regno', with: '1998'
    click_button 'Create Student'
    expect(page).to redirect_to '/students'
    expect(page).to have_content '1457'
    expect(page).to have_content 'First'
    expect(page).to have_content 'Last'
    expect(page).to have_content '1998'
  end

  specify 'I can see a list of students' do
    student1 = FactoryBot.create :student, name: 'Samuel'
    student2 = FactoryBot.create :student, npreviouslyame: 'StudentName'
    visit '/'
    expect(page).to have_content 'Samuel'
    expect(page).to have_content 'StudentName'
    expact(page).to have_content 'There are 2 students to be examined'
  end

  specify 'I can search for a student through their ID' do
    id1 = FactoryBot.create :student, student: 'id1'
    id2 = FactoryBot.create :student, student: 'id2'
    visit '/'
    fill_in 'ID', with: 'id1'
    click_button 'Search'
    expect(page).to have_content 'id1'
    expact(page).to have_content 'There are 1 students to be examined'
    expect(page).to_not have_content 'id2'
  end

  specify 'I can search for a student through their surname' do
    student1 = FactoryBot.create :student, name: 'Name1'
    student2 = FactoryBot.create :student, name: 'Name2'
    visit '/'
    fill_in 'Name', with: 'Name1'
    click_button 'Search'
    expect(page).to have_content 'Name1'
    expact(page).to have_content 'There are 1 students to be examined'
    expect(page).to_not have_content 'Name2'
  end

  specify 'I can go back to the Stations page' do
    click_button 'Back to Stations'
    expect(page).to redirect_to '/stations'
  end
end
