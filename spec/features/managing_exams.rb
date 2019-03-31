require 'rails_helper'

describe 'Managing exams' do
    specify 'I can create new exam from an archived' do
        # Done by Admin
        # Accept: New exam is saved into database
        visit '/exams'
        click_link 'New Exam'
        fill_in 'Exam code', with: 'COMU07'
        fill_in 'Name', with: 'Exam Name'
        fill_in 'Date', with: '2019/10/10'
        fill_in 'Module code', with: 'COM1001'
        click_button 'Create Exam'
        expect(page).to have_content 'Exam was successfully created'
    end

    specify 'I can create new exam from a blank' do
        # Done by Admin
        # Accept: New exam is saved into database
    end

    specify 'I can assign student to exam' do
        # Done by Admin
        # Accept: Students are linked to exam
    end

    specify 'I can view students who have not been examined' do
        # Done by Examiner
        # Accept: Display students who have not been accessed
    end

    specify 'I can view students who have been examined' do
        # Done by Examiner
        # Accept: Display students who have been accessed
    end

    specify 'I can submit an exam' do
        # Done by Examiner
        # Accept: The form is saved in database
    end

    specify 'I can unarchive an archived exam' do
        # Done by admin
        # Accept: Exam boolean is set false
    end

    specify 'I can know that I have completed an exam form' do
        # Done by Examiner
        # Accept: Confirmation pop up
    end

    specify 'I can return to the Station Selection Page' do
        # Done by Examiner
        # Require password
        # Accept: return to Station Selection Page
    end

    specify 'I can select exam to be examined' do
        # Done By Module Lead, to pass device to Examiner
        # Accept: return to Exam page
    end

    specify 'I can enter my name' do
        # Done by Examiner
        # Accept: Examiner name is saved into database
    end

    specify 'I can edit upcoming exams' do
        # Done by Admin
        # Accept: Access exam edit page for upcoming exams
        # Reject: Access exam edit page for completed exams
    end

    specify 'I can select an exam' do
        # Done by Module Lead
        # Accept: Acccess exam page for upcoming exams
        # Reject: Accesss exam page for completed exams
    end

    specify 'I can view today\'s exams' do
        # Done by Module Lead
        # Accept: View exams happening today
        # Reject: View exams not happening today
    end

    specify 'I can start an exam' do
        # Done by Examiner
        # Accept: Access and begin exam page, Starts examination session
    end

    # until story 64, when searching for exams




end
