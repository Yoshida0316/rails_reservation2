class Reservation < ApplicationRecord 

  belongs_to :user
  belongs_to :room
  
  validates :checkin_day, presence: true
  validates :checkout_day, presence: true
  validates :num_people, presence: true,numericality: {only_integer: true, greater_than: 0}
  validate :date_check
  validate :days
  validate :total_price


def date_check
 unless self.checkin_day.to_s < self.checkout_day.to_s
 errors.add(:checkout_day,"は開始日より前の日を設定することはできません。")
end
end

def days
  if checkin_day == nil || checkout_day ==nil
  errors.add(:days,"開始日および終了日を設定してください。")
  else
  days = (checkout_day - checkin_day)
  end
end

def total_price
 if checkin_day == nil || checkout_day ==nil
  errors.add(:total_price,"開始日および終了日を設定してください。")
  else
total_price = (days.to_i * num_people.to_i * room.room_price.to_i)
end
end
end
