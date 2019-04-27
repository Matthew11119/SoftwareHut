# == Schema Information
#
# Table name: exams_students
#
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

  def self.select_students(exam)
    ex_id = "'"+exam+"'"
    ExamsStudent.joins(:student).where("exam_id="+ex_id)
  end
end
