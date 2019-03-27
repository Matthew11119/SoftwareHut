class AddNumberToCriteria < ActiveRecord::Migration[5.2]
  def change
    add_column :criteria, :number, :integer
  end
end
