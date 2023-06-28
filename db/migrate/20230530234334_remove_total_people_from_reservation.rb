class RemoveTotalPeopleFromReservation < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :total_people, :integer
  end
end
