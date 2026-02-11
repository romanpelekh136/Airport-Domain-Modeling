class CreateGateAssignments < ActiveRecord::Migration[8.0]
  def change
    create_table :gate_assignments do |t|
      t.references :gate, null: false, foreign_key: true
      t.references :flight_instance, null: false, foreign_key: true
      t.datetime :active_from
      t.datetime :active_to

      t.timestamps
    end
  end
end
