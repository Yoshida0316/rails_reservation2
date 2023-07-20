class Room < ApplicationRecord
  belongs_to :user
  has_many :resevations

  has_one_attached :image
  
  validates :room_name, presence: true
  validates :room_price, presence: true,numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :room_address, presence: true
  validates :room_detail, presence: true
  
  
def self.ransackable_attributes(auth_object = nil)
    ["room_address","room_name","room_detail","created_at","image","id"]
end

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob", "resevations", "user"]
  end
end