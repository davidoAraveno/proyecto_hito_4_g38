class AddCodeGiftToMarriages < ActiveRecord::Migration[5.2]
  def change
    add_column :marriages, :code_gift, :string
  end
end
