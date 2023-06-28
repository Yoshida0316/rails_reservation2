 class Book < ApplicationRecord 

 def self.ransackable_attributes(auth_object = nil)
    ["room_name", "room_detail"]
end