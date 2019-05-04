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
  has_one_attached :audio
  has_many :criteria_results, inverse_of: :station_result #, :foreign_key=>:criteria_result_id
  accepts_nested_attributes_for :criteria_results

  # Selects remaining student for a stationID, returns Student
  def self.get_remaining_student(stationID)
    students_in_station = ExamsStudent.joins("INNER JOIN stations ON stations.exam_id = exams_students.exam_id").where('stations.id=?',stationID)
    ss = Student.where(:username=>students_in_station.select(:student_id))
    remaining_student = ss.where.not(:username=>StationResult.where(:station_id=>stationID).select(:username))        
  end

  # Selects completed student for a station ID by examinerName, returns Student
  # Student is examined if mark is not empty
  def self.get_completed_student(stationID,examinerName)
    completed_student = Student.joins("INNER JOIN station_results ON students.username = station_results.username").where("station_id = ? AND mark IS NOT NULL", stationID)
  end

end
