class CreateSeats < ActiveRecord::Migration[8.0]
  def change
    create_table :seats do |t|
      t.string :seat_number
      t.string :cabin_class
      t.references :aircraft, foreign_key: true

      t.timestamps
    end
  end
end
