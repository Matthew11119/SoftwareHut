require 'rails_helper'

describe 'Choosing students' do
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

  specify 'I can go back to the Stations page'
    click_button 'Back to Stations'
    expect(page).to have_content

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

end
