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
  has_many :exams_students
  has_many :students, :through => :exams_students
  has_many :stations, inverse_of: :exam

  scope :undeployed, -> { where(status: 0).order(:date) }
  scope :deployed, -> { where(status: 1).order(:date) }
  scope :completed, -> { where(status: 2).order(:date) }
  scope :archive, -> { where(status: 3).order(:date) }

  # CSV import
  # Params: file - CSV file containing students
  # No return
  # Adds students contained within CSV ot the Exam instance
  def student_import(file)
    CSV.foreach(file.path, headers: true) do |row|
      if !Student.exists?(:username =>row['username'])
        self.students << Student.new(row.to_hash)
      elsif (!self.students.exists?(:username =>row['username']))
        self.students << Student.find(row['username'])
      end
    end
  end
end
