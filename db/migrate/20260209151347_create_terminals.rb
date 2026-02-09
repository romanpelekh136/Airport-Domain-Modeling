class CreateTerminals < ActiveRecord::Migration[8.0]
  def change
    create_table :terminals do |t|
      t.string :code
      t.references :airport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
