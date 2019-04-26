class CreateJoinTableExamsStudents < ActiveRecord::Migration[5.2]
  def change
    change_column :exams_students, :exam_id, :string
    change_column :exams_students, :student_id, :integer
  end
end
