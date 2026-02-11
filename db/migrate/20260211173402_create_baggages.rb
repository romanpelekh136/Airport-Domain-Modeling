class CreateBaggages < ActiveRecord::Migration[8.0]
  def change
    create_table :baggages do |t|
      t.references :ticket, null: false, foreign_key: true
      t.integer :weight
      t.string :tag_number

      t.timestamps
    end
  end
end
