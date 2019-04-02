require 'rails_helper'

describe 'Choosing students' do
    let(:user) { FactoryBot.create(:user) }
    before { login_as user }

    specify 'I can see the station & module that I have previously selected' do
      visit '/'
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

  specify 'I can filter through the database by searching student ID' do
    FactoryBot.create :product
    visit '/'
    click_link 'Edit'
    fill_in 'Name', with: 'Updated Name'
    fill_in 'Description', with: 'Updated Description'
    click_button 'Update Product'
    expect(page).to have_content 'Product was successfully updated'
    expect(page).to have_content 'Updated Description'
    click_link 'Edit'
    fill_in 'Name', with: ''
    click_button 'Update Product'
  end

  specify 'I can see a list of students' do
    student1 = FactoryBot.create :student, name: 'Samuel'
    student2 = FactoryBot.create :student, name: 'StudentName'
    visit '/'
    expect(page).to have_content 'Samuel'
    expect(page).to have_content 'StudentName'
  end

  specify 'I can search for a student through their ID' do
    id1 = FactoryBot.create :student, student: 'id1'
    id2 = FactoryBot.create :student, student: 'id2'
    visit '/'
    fill_in 'ID', with: 'id1'
    click_button 'Search'
    expect(page).to have_content 'id1'
    expect(page).to_not have_content 'id2'
  end

  specify 'I can search for a student through their surname' do
    student1 = FactoryBot.create :student, name: 'Name1'
    student2 = FactoryBot.create :student, name: 'Name2'
    visit '/'
    fill_in 'Name', with: 'Name1'
    click_button 'Search'
    expect(page).to have_content 'Name1'
    expect(page).to_not have_content 'Name2'
  end


  specify 'I can delete a product' do
    product1 = FactoryBot.create :product, name: 'Product2BeDeleted'
    product2 = FactoryBot.create :product, name: 'Product 2'
    visit '/'
    within 'tr', text: 'Product2BeDeleted' do
      click_link 'Destroy'
    end
    expect(page).to have_content 'Product 2'
    expect(page).to_not have_content 'Product2BeDeleted'
  end

  specify 'I assign a category to a product' do
    book_category = FactoryBot.create :category, name: 'Books'
    FactoryBot.create :product, name: 'Test Product'
    visit '/'
    click_link 'Edit'
    expect(page).to have_content 'Category'
    select 'Books', from: 'Category'
    click_button 'Update Product'
    expect(page).to have_content 'Books'
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

    specify 'I can add a new student' do
      # Logging in
      visit '/'
      fill_in 'Username', with: 'aca17scf'
      fill_in 'Password', with: 'Rnrulbl1'
      click_button 'Log in'
      # expect(page).to have_content 'Signed in successfully.'
      expect(page).to_not have_content ' You need to sign in or sign up before continuing.'
      click_link 'Add New Student'
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

end
