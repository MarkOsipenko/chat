class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, email: true
  validates :name, presence: true

  has_many :messages
  has_many :users_rooms
  has_many :rooms, through: :users_rooms

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

end
