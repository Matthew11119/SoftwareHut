class CreateCriteria < ActiveRecord::Migration[5.2]
  def change
    create_table :criteria do |t|
      t.integer :criteria_id
      t.text :criteria_description
      t.boolean :criteria_critical
      t.integer :station_id

      t.timestamps
    end
  end
end
