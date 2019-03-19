class DropIdColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :criteria, :criteria_id
    remove_column :criteria_results, :criteria_feedback_id
    remove_column :exams, :exam_id
    remove_column :station_results, :result_id
    remove_column :stations, :station_id
  end
end
