class CreateStars < ActiveRecord::Migration[5.2]
  def change
    create_table :stars do |t|
      t.integer :calification
      t.string :message
      t.references :marriage, foreign_key: true

      t.timestamps
    end
  end
end
