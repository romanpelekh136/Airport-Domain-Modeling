class CreateAirlines < ActiveRecord::Migration[8.0]
  def change
    create_table :airlines do |t|
      t.string :name

      t.timestamps
    end
  end
end
