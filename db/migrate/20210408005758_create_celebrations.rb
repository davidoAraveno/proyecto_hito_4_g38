class CreateCelebrations < ActiveRecord::Migration[5.2]
  def change
    create_table :celebrations do |t|
      t.string :address
      t.string :hour
      t.string :date
      t.references :marriage, foreign_key: true

      t.timestamps
    end
  end
end
