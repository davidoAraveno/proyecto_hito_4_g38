class AddMessageInvitedToMarriageInviteds < ActiveRecord::Migration[5.2]
  def change
    add_column :marriage_inviteds, :message_invited, :string
  end
end
