class FixesInStationsAndStudent < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :admin, :boolean
    add_column :users, :user_type, :string
    remove_column :stations, :exam_id, :integer
    add_column :stations, :exam_id, :string
  end
end
