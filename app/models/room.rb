class Room < ApplicationRecord
  has_many :rooms, through: :user_in_room
end
