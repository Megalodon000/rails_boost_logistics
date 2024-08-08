class AddAdministratorToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :administrator, null: false, foreign_key: true
  end
end
