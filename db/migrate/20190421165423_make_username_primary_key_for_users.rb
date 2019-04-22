class MakeUsernamePrimaryKeyForUsers < ActiveRecord::Migration[5.2]
  execute "ALTER TABLE users DROP CONSTRAINT users_pkey"
  def change
    remove_column :users, :id
  end
  execute "ALTER TABLE users ADD PRIMARY KEY (username)"
end
