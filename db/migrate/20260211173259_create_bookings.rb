class CreateBookings < ActiveRecord::Migration[8.0]
  def change
    create_table :bookings do |t|
      t.string :reference_number

      t.timestamps
    end
  end
end
