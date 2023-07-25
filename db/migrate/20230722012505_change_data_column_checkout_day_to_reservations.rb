class ChangeDataColumnCheckoutDayToReservations < ActiveRecord::Migration[6.1]
  def change
  change_column :reservations, :checkout_day, :date
  end
end
