class RemovingTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :uni_modules
    drop_table :modules_students
  end
end
