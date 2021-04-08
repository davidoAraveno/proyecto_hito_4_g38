class AddPasswordToMarriage < ActiveRecord::Migration[5.2]
  def change
    add_column :marriages, :password, :string
  end
end
