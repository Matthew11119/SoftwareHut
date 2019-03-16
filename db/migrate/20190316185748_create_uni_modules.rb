class CreateUniModules < ActiveRecord::Migration[5.2]
  def change
    create_table :uni_modules do |t|
      t.string :module_code
      t.string :module_name

      t.timestamps
    end
  end
end
