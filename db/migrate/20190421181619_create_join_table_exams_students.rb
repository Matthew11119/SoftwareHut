class CreateJoinTableExamsStudents < ActiveRecord::Migration[5.2]
  def change
    create_join_table :exams, :students do |t|
      t.index [:student_id, :exam_id]
      t.index [:exam_id, :student_id]
    end
    change_column :exams_students, :exam_id, :string
    change_column :exams_students, :student_id, :integer
  end
end
