class AddCriteriumIdToCriteriaResults < ActiveRecord::Migration[5.2]
  def change
    add_column :criteria_results, :criterium_id, :integer
  end
end
