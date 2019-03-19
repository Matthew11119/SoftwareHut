class AddStatusToExams < ActiveRecord::Migration[5.2]
  def change
    add_column :exams, :status, :integer
  end
end
