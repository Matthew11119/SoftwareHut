class ChangeStudentIdInStationResults < ActiveRecord::Migration[5.2]
  def change
    change_column :station_results, :student_id, :string
  end
end
