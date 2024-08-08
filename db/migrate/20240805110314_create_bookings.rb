class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :origin
      t.string :destination
      t.date :shipment_date
      t.float :weight
      t.float :length
      t.float :width
      t.float :height
      t.text :special_instructions
      t.string :status

      t.timestamps
    end
  end
end
