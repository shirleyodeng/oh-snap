class AddDateHoursLocationToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :date, :date, null: false
    add_column :bookings, :hours, :integer, null: false
    add_column :bookings, :location, :string, null: false
  end
end
