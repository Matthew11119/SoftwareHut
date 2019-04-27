class RenameStationIdInCriteriaResults < ActiveRecord::Migration[5.2]
  def change
    rename_column :criteria_results, :station_id, :station_result_id
  end
end
