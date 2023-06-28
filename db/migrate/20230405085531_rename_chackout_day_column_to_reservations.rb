class RenameChackoutDayColumnToReservations < ActiveRecord::Migration[6.1]
  def change
      rename_column :reservations, :chackout_day, :checkout_day
  end
end
