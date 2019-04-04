class ChangesToStudents < ActiveRecord::Migration[5.2]
  def change
    change_table :students do |t|
      t.remove :id, :student_id
      t.index :regno
      t.string :username
    end
  end
end
