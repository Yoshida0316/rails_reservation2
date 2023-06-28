class Room < ApplicationRecord
  belongs_to :user
  has_many :resevations

  has_one_attached :image
  
  validates :room_name, presence: true
  validates :room_price, presence: true
  validates :room_address, presence: true
  validates :room_detail, presence: true
  
  
def self.ransackable_attributes(auth_object = nil)
    ["room_address"]
end
  #def self.ransackable_attributes(auth_object = nil)
    #%w[room_name room_address room_detail room_price]
  #end
  
  #def self.ransackable_associations(auth_object = nil)
        #[]
  #end
end
