class ChangeDateTypeFromBookings < ActiveRecord::Migration[5.1]
  def change
    change_column :bookings, :date, :datetime
  end
end
