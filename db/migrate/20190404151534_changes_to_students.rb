class ChangesToStudents < ActiveRecord::Migration[5.2]
  execute "ALTER TABLE students DROP CONSTRAINT students_pkey"
  def change
    change_table :students do |t|
      t.remove :id, :student_id
      t.string :username
    end
    execute "ALTER TABLE students ADD PRIMARY KEY (regno)"
  end
end
