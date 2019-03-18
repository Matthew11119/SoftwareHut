require 'rails_helper'

describe 'Managing exams' do

    specify 'I can create new exam from an archived' do
        # Done by Admin
        # Accept: New exam is saved into database
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

    # until story 53, when searching for exams
    


end