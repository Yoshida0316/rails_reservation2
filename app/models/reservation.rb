class Reservation < ApplicationRecord 
  belongs_to :user
  belongs_to :room
  
  validates :checkin_day, presence: true
  validates :checkout_day, presence: true
  validates :num_people, presence: true,numericality: {only_integer: true, greater_than: 0}
  validate :date_check
  validate :total_price

def date_check
 errors.add(:checkout_day,"は開始日より前の日を設定することはできません。") unless  
 self.checkin_day <  self.checkout_day
end

def days
  days = (checkout_day.to_date - checkin_day.to_date).to_i 
end

def total_price
 total_price = (days * num_people * room.room_price )
 end

end
