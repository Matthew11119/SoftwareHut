class ChangeExam < ActiveRecord::Migration[5.2]
  execute "ALTER TABLE exams DROP CONSTRAINT exams_pkey"
  def change
    remove_column :exams, :id
  end
  execute "ALTER TABLE exams ADD PRIMARY KEY (exam_code)"
end
