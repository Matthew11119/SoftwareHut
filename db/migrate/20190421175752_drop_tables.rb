class DropTables < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :modules, :students
    drop_table :uni_modules
  end
end
