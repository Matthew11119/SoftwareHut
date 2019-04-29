# == Schema Information
#
# Table name: exams_students
#
#  mark       :integer
#  exam_id    :string           not null
#  student_id :string           not null
#
# Indexes
#
#  index_exams_students_on_exam_id_and_student_id  (exam_id,student_id)
#  index_exams_students_on_student_id_and_exam_id  (student_id,exam_id)
#

class ExamsStudent < ApplicationRecord
  belongs_to :student
  belongs_to :exam

  # Select students in an exam, returns exams_students record  
  def self.select_students(exam)  
    ExamsStudent.joins(:student).where("exam_id=?",exam)
  end
end
