class ChangeStudentIdToUsernameInStationResults < ActiveRecord::Migration[5.2]
  def change
    remove_column :station_results, :student_id, :integer
    add_column :station_results, :username, :string
  end
end
