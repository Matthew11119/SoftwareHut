# == Schema Information
#
# Table name: students
#
#  forename   :string
#  regno      :integer
#  surname    :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_students_on_regno  (regno)
#

class Student < ApplicationRecord
  has_and_belongs_to_many :exams

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

end
