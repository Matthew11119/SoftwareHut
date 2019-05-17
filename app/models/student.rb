# == Schema Information
#
# Table name: students
#
#  forename   :string
#  regno      :integer
#  surname    :string
#  username   :string           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ApplicationRecord
  #has_and_belongs_to_many :exams
  has_many :exams_students
  has_many :exams, :through => :exams_students

  #Params: file - CSV file containing students data
  #No return values
  #Uses a csv file to populate students table
  # Imports student
  def self.student_import(file)
    students = []
    columns = [:surname, :forename, :username, :regno]
    CSV.foreach(file.path, headers: true) do |row|
      if !Student.exists?(:username =>row['username'])
        students << Student.new(row.to_hash)
      end
    end
    Student.import(columns, students)
  end

  #Populates user fields from LDAP request
  #No params
  #No return values
  # Retrieves student information and updates database
  def self.from_ldap(student_username)
    studentUser = User.new(username:student_username)
    studentUser.get_info_from_ldap
    student = Student.find(student_username)
    student.update(forename:studentUser.givenname, surname:studentUser.sn)
    # Student.find_or_create_by(forename:student.givenname, surname:student.sn,username:student_username)

  end

end
