class FixColumnNameInvited < ActiveRecord::Migration[5.2]
  def change
    rename_column :inviteds, :code, :password_digest
  end
end
