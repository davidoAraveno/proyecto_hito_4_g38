class AddLinkGiftToMarriages < ActiveRecord::Migration[5.2]
  def change
    add_column :marriages, :link_gift, :string
  end
end
