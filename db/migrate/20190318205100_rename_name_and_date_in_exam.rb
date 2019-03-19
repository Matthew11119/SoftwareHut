class RenameNameAndDateInExam < ActiveRecord::Migration[5.2]
  def change
    rename_column :exams, :exam_name, :name
    rename_column :exams, :exam_date, :date
  end
end
