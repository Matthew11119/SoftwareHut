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

require 'rails_helper'

RSpec.describe ExamsStudent, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
