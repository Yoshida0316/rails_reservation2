class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :chackin_day, null: false
      t.datetime :chackout_day, null: false
      t.integer :num_people, null: false
      t.integer :total_people, null: false
      t.integer :total_price, null: false

      t.timestamps
    end
  end
end
