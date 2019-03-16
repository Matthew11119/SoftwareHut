class CreateCriteriaResults < ActiveRecord::Migration[5.2]
  def change
    create_table :criteria_results do |t|
      t.integer :criteria_feedback_id
      t.integer :criteria_mark
      t.integer :answer
      t.integer :station_id

      t.timestamps
    end
  end
end
