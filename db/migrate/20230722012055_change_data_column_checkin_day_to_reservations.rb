class ChangeDataColumnCheckinDayToReservations < ActiveRecord::Migration[6.1]
  def change
  change_column :reservations, :checkin_day, :date
  end
end
