class CreateMarriageInviteds < ActiveRecord::Migration[5.2]
  def change
    create_table :marriage_inviteds do |t|
      t.references :marriage, foreign_key: true
      t.references :invited, foreign_key: true

      t.timestamps
    end
  end
end
