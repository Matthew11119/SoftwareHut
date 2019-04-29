# == Schema Information
#
# Table name: station_results
#
#  id            :bigint(8)        not null, primary key
#  audio         :string
#  examiner_name :string
#  feedback      :string
#  mark          :integer
#  username      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  station_id    :integer

class StationResult < ApplicationRecord
  belongs_to :station, :foreign_key=>:station_id
  has_many :criteria_results, inverse_of: :station_result
  accepts_nested_attributes_for :criteria_results

  # Creates record for student in station_record if does not exist
  def self.write_students(examinerName,stationID, examID)
    examsStudent = ExamsStudent.select_students(examID)
    examsStudent.each do |examStudent|
      curStu = StationResult.find_or_create_by(username: examStudent.student_id, station_id: stationID) 
    end
  end

  # Selects remaining student for a stationID, returns Student
  # Student is not examined if mark is empty
  def self.get_remaining_student(stationID)        
    remaining_student = Student.joins("INNER JOIN station_results ON students.username = station_results.username").where("station_id = ? AND mark IS NULL", stationID)
  end
  
  # Selects completed student for a station ID by examinerName, returns Student
  # Student is examined if mark is not empty
  def self.get_completed_student(stationID,examinerName)    
    completed_student = Student.joins("INNER JOIN station_results ON students.username = station_results.username").where("station_id = ? AND mark IS NOT NULL", stationID)
  end

end
