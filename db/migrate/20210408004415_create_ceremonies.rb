class CreateCeremonies < ActiveRecord::Migration[5.2]
  def change
    create_table :ceremonies do |t|
      t.string :address
      t.string :hour
      t.string :date
      t.references :marriage, foreign_key: true

      t.timestamps
    end
  end
end
