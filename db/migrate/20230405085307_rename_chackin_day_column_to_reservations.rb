class RenameChackinDayColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :chackin_day, :checkin_day
  end
end
