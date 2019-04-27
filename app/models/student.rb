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

  def self.student_import(file)
    students = []
    columns = [:surname, :forename, :username, :regno]
    CSV.foreach(file.path, headers: true) do |row|
      if !Student.exists?(:regno =>row[3])
        students << Student.new(row.to_hash)
      end
    end
    Student.import(columns, students)
  end

  def self.from_ldap(student_username)
    student = User.new(username:student_username)
    student.get_info_from_ldap
    Student.find_or_create_by(forename:student.givenname, surname:student.sn,username:student_username)
  end

end
