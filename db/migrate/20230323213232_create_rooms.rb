class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name, null: false
      t.integer :room_price, null: false
      t.string :room_address, null: false
      t.string :room_detail

      t.timestamps
    end
  end
end
