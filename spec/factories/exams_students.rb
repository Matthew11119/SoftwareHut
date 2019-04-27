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

FactoryBot.define do
  factory :exams_student do
    student { nil }
    client { nil }
  end
end
