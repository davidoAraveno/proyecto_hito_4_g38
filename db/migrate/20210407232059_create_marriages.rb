class CreateMarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :marriages do |t|
      t.string :name1
      t.string :name2
      t.string :phone_name1
      t.string :phone_name2
      t.string :email_name1
      t.string :email_name2

      t.timestamps
    end
  end
end
