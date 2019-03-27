class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :score
      t.integer :station_id

      t.timestamps
    end
  end
end
