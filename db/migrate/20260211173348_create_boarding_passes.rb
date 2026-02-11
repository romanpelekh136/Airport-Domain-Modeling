class CreateBoardingPasses < ActiveRecord::Migration[8.0]
  def change
    create_table :boarding_passes do |t|
      t.references :ticket, null: false, foreign_key: true
      t.references :seat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
