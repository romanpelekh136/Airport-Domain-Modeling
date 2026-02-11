class CreateCheckinAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :checkin_assignments do |t|
      t.references :flight_instance, null: false, foreign_key: true
      t.references :checkin_counter, null: false, foreign_key: true
      t.datetime :active_from
      t.datetime :active_to

      t.timestamps
    end
  end
end
