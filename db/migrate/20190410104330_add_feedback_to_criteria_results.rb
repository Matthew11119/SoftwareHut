class AddFeedbackToCriteriaResults < ActiveRecord::Migration[5.2]
  def change
    add_column :criteria_results, :feedback, :text
  end
end
