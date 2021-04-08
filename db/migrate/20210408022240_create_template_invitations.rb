class CreateTemplateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :template_invitations do |t|
      t.string :image
      t.references :marriage, foreign_key: true
      t.string :message_personalized

      t.timestamps
    end
  end
end
