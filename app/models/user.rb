class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, email: true
  validates :name, presence: true

  has_many :messages
  has_many :users_rooms
  has_many :rooms, through: :users_rooms
end
