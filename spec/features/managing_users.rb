require 'rails_helper'

describe 'Managing users' do
    
    specify  'I can add an admin' do 
        # Accept: New admin created in database
    end

    specify 'I can delete an admin ' do
        # Reject: Selected admin is still in database
    end

    specify 'I can add a module lead' do
        # Accept: New module lead in database
    end

    specify 'I can delete a module lead' do
        # Reject: Selected module lead is still in database
    end

    specify 'I can import students from a csv' do
        # Accept: Students are imported into database
    end

    specify 'I can add new student from a form' do
        # Accept: Student is added into the database after completing a form
    end

    specify 'I can delete a student' do
        # Reject: Selected student is still in database
    end

end
