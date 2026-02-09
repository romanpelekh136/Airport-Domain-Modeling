class CreateFlightInstances < ActiveRecord::Migration[8.0]
  def change
    create_table :flight_instances do |t|
      t.references :flight, null: false, foreign_key: true
      t.references :aircraft, null: false, foreign_key: true
      t.datetime :scheduled_departure_at, bull: false
      t.datetime :scheduled_arrival_at, bull: false
      t.string :status, null: false, default: "scheduled"

      t.timestamps
    end
  end
end
