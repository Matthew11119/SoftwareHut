class RemoveStationIdFromCriteriaResult < ActiveRecord::Migration[5.2]
  def change
    remove_column :criteria_results, :station_id, :integer
  end
end
