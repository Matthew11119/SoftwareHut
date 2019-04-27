# == Schema Information
#
# Table name: exams
#
#  date        :date
#  exam_code   :string           not null, primary key
#  module_code :string
#  name        :string
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Exam < ApplicationRecord
  #has_and_belongs_to_many :students
  has_many :exams_students
  has_many :students, :through => :exams_students  

  has_many :stations, inverse_of: :exam

  scope :undeployed, -> { where(status: 0).order(:date) }
  scope :deployed, -> { where(status: 1).order(:date) }
  scope :completed, -> { where(status: 2).order(:date) }
  scope :archive, -> { where(status: 3).order(:date) }
  scope :templates, -> { where(status: 4).order(:date) }


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
