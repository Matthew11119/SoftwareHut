class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :student_id
      t.string :forename
      t.string :surname
      t.integer :regno

      t.timestamps
    end
  end
end
