class MakeUsernamePrimaryKeyForStudents < ActiveRecord::Migration[5.2]
  execute "ALTER TABLE students DROP CONSTRAINT students_pkey"
  def change
    remove_column :students, :regno
  end
  execute "ALTER TABLE students ADD PRIMARY KEY (username)"
end
