class RemoveModeratorFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :moderator, :boolean
  end
end
