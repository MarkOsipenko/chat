class Room < ApplicationRecord
  has_many :users_rooms
  has_many :users, through: :users_rooms
  has_many :messages, dependent: :destroy 

  validates :name, presence: true
  validates :owner_id, presence: true
end
