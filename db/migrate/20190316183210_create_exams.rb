class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :exam_code
      t.date :exam_date
      t.string :exam_name
      t.string :module_code

      t.timestamps
    end
  end
end
