class RenameExamCodeToExamIdInStations < ActiveRecord::Migration[5.2]
  def change
    rename_column :stations, :exam_code, :exam_id
  end
end
