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

  #Generates a csv file from Exam object data
  #No params
  #Returns a csv file
  # CSV
  def to_csv
    students = self.students
    columns1 = %w{forename surname username regno}
    columns2 = ["Last Access", "Availability", "TESTING UPLOAD [Total Pts: 100]", "Grading Notes", "Notes Format", "Feedback to Learner", "Feedback Format"]
    CSV.generate(headers: true) do |csv|
      csv << columns1 + columns2
      students.each do |student|
        csv << student.attributes.values_at(*columns1) + [" ", "Yes", " "] +  [ feedback(student) ]
      end
    end
  end

  def pass_exam(student)
    result_total = 0
    total_required = 0
    station_results = StationResult.where( username: student.username, station_id: self.stations.pluck(:id) )
    station_results.each do |station_result|
      result_total += station_result.mark
    end
    self.stations.each do |station|
      total_required += station.pass_mark
    end
    if result_total >= total_required
      "Exam Passed"
    else
      "Exam Failed"
    end
  end

  def feedback(student)
    feedback = []
    station_results = StationResult.where( username: student.username, station_id: self.stations.pluck(:id) )
    station_results.each do |station_result|
      station_feedback = [station_result.feedback]
      feedback.concat station_feedback
    end
    feedback
  end
  # CSV import
  # Params: file - CSV file containing students
  # No return
  # Adds students contained within CSV ot the Exam instance
  def student_import(file)
    CSV.foreach(file.path, headers: true) do |row|
      if (!Student.exists?(:username =>row['Username']))
        s = Student.new
        s.forename = row['First Name']
        s.surname = row['Last Name']
        s.username = row['Username']
        s.regno = row['Student ID']


        self.students << s
      elsif (!self.students.exists?(:username =>row['Username']))
        self.students << Student.find(row['Username'])
      end
    end
  end
end
