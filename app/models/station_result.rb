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

  has_many :criteria_results, inverse_of: :station_results
  accepts_nested_attributes_for :criteria_results

  def self.write_students(examinerName,stationID, examID)
    examsStudent = ExamsStudent.select_students(examID)
    examsStudent.each do |examStudent| 
      curStu = StationResult.find_or_create_by(username: examStudent.student_id, station_id: stationID)
      if curStu.examiner_name.nil?
        curStu.update(examiner_name:examinerName)
      end
    end
  end

  def self.get_remaining_student(stationID)
    # remaining_student = self.where(station_id: stationID).where(mark:nil)
    remaining_student = Student.joins("INNER JOIN station_results ON students.username = station_results.username").where("station_id ="+stationID+"AND mark IS NULL")
  end

end
