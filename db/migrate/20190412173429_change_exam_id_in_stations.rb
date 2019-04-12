class ChangeExamIdInStations < ActiveRecord::Migration[5.2]
  def change
    change_column :stations, :exam_id, :string
  end
end
