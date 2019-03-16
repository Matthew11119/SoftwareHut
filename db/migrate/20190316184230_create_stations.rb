class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.integer :station_id
      t.string :station_name
      t.integer :pass_mark
      t.integer :exam_id

      t.timestamps
    end
  end
end
