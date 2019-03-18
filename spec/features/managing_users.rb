require 'rails_helper'

describe 'Managing users' do
    
    specify  'I can add an admin' do 
        # Done by Admin
        # Accept: New admin created in database
    end

    specify 'I can delete an admin ' do
        # Done by Admin
        # Reject: Selected admin is still in database
    end

    specify 'I can add a module lead' do
        # Done by Admin
        # Accept: New module lead in database
    end

    specify 'I can delete a module lead' do
        # Done by Admin
        # Reject: Selected module lead is still in database
    end

    specify 'I can import students from a csv' do
        # Done by Admin
        # Accept: Students are imported into database
    end

    specify 'I can import students based on their module' do
        # Done by Admin
        # Accept: Students are imported into database
    end

    specify 'I can add new student from a form' do
        # Done by Examiner
        # Accept: Student is added into the database after completing a form
    end

    specify 'I can delete a student' do
        # Done by ?
        # Reject: Selected student is still in database
    end

end
