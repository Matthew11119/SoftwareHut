class CreateJoinTableStudentsModules < ActiveRecord::Migration[5.2]
  def change
    create_join_table :students, :modules do |t|
      t.index [:student_id, :module_id]
      t.index [:module_id, :student_id]
    end
  end
end
