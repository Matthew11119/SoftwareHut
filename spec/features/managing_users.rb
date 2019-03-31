require 'rails_helper'

describe 'Managing Users' do
    specify 'I can add an admin' do
        # Done by Admin
        # Accept: New admin created in database
        visit '/users'
        click_link 'New User'
        fill_in 'Username', with: 'abcdefg'
        fill_in 'Forename', with: 'Sam'
        fill_in 'Surname', with: 'Fung'
        check 'Admin'
        click_button 'Create User'
        expect(page).to have_content 'User was successfully created'
        # within(:css, 'table') { expect(page).to have_content 'abcdefg'}
    end

    specify 'I can see a list of admins' do
      # Done by admin
      # Accept: Both admins are visible
      admin1 = FactoryBot.create :admin, username: 'admin1'
      admin2 = FactoryBot.create :admin, username: 'admin2'
      modulelead1 = FactoryBot.create :modulelead, username: 'modulelead1'
      visit '/users'
      expect(page).to have_content 'admin1'
      expect(page).to have_content 'admin2'
    end

    specify 'I can delete an admin' do
      # Done by admin
      # Accept: The admin created is no longer in the list
      admin1 = FactoryBot.create :admin, username: 'admin1'
      modulelead1 = FactoryBot.create :modulelead, username: 'modulelead1'
      visit '/users'
      click_link 'Delete'
      expect(page).to have_content 'modulelead1'
      expect(page).to_note have_content 'admin1'
    end

    specify 'I can add a module lead'
      # Done by admin
      # Accept: The module lead appears in the database
      visit '/users'
      click_link 'New User'
      fill_in 'Username', with: 'abcdefg'
      fill_in 'Forename', with: 'Sam'
      fill_in 'Surname', with: 'Fung'
      click_button 'Create User'
      expect(page).to have_content 'User was successfully created'
    end

    specify 'I can delete a module lead'
      # Done by admin
      # Accept: The module lead is no longer in the list
      admin1 = FactoryBot.create :admin, username: 'admin1'
      modulelead1 = FactoryBot.create :modulelead, username: 'modulelead1'
      visit '/users'
      within 'tr', text: 'modulelead1' do
        click_link 'Delete'
      end
      expect(page).to have_content 'admin1'
      expect(page).to_note have_content 'modulelead1'
    end
end
