class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  # tester cette ligne
  has_many :created_rooms, class_name: 'Room'
  has_many :joined_rooms, through: :memberships, source: :room
  has_many :pictures
  has_many :comments
  has_many :upvotes


  def all_rooms
    room_ids = created_rooms.pluck(:id) + joined_rooms.pluck(:id)
    Room.where(id: room_ids)
  end
end
