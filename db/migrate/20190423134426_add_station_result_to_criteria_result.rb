class AddStationResultToCriteriaResult < ActiveRecord::Migration[5.2]
  def change
    add_reference :criteria_results, :station_result, foreign_key: true
  end
end
