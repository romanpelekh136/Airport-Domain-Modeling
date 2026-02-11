class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :passenger, null: false, foreign_key: true
      t.references :flight_instance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
