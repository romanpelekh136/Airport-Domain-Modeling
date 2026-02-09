class CreateAircrafts < ActiveRecord::Migration[8.0]
  def change
    create_table :aircrafts do |t|
      t.string :serial_number
      t.references :airline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
