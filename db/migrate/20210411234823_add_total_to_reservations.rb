class AddTotalToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :total, :float, default: 60.000
    add_column :reservations, :payed, :boolean, default: false
  end
end
