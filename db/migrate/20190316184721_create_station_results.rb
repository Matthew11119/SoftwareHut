class CreateStationResults < ActiveRecord::Migration[5.2]
  def change
    create_table :station_results do |t|
      t.integer :result_id
      t.integer :station_id
      t.integer :student_id
      t.string :examiner_name
      t.integer :mark
      t.string :feedback
      t.string :audio

      t.timestamps
    end
  end
end
