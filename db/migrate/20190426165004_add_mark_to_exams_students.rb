class AddMarkToExamsStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :exams_students, :mark, :integer
  end
end
