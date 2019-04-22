class AddTemplateIdToStations < ActiveRecord::Migration[5.2]
  def change
    add_column :stations, :template_id, :integer
  end
end
