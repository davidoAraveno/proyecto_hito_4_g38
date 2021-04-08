class AddEnterpriseGiftToMarriages < ActiveRecord::Migration[5.2]
  def change
    add_column :marriages, :enterprise_gift, :string
  end
end
