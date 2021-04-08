class AddInvitedConfirmToMarriageInviteds < ActiveRecord::Migration[5.2]
  def change
    add_column :marriage_inviteds, :invited_confirm, :boolean, default: false
  end
end
