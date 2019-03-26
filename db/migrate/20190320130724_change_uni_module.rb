class ChangeUniModule < ActiveRecord::Migration[5.2]
  execute "ALTER TABLE uni_modules DROP CONSTRAINT uni_modules_pkey"
  def change
    remove_column :uni_modules, :id
  end
  execute "ALTER TABLE uni_modules ADD PRIMARY KEY (module_code)"
end
