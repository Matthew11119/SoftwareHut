class ChangeStudentIdInExamStudents < ActiveRecord::Migration[5.2]
  def change
    change_column :exams_students, :student_id, :string
  end
end
