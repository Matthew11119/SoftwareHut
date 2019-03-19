class RemoveExamIdFromStations < ActiveRecord::Migration[5.2]
  def change
    remove_column :stations, :exam_id, :integer
    add_column :stations, :exam_code, :string
  end
end
