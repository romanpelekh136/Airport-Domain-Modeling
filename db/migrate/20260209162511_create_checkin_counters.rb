class CreateCheckinCounters < ActiveRecord::Migration[8.0]
  def change
    create_table :checkin_counters do |t|
      t.string :code
      t.references :terminal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
