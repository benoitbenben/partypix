class Picture < ApplicationRecord
  #relations
  belongs_to :room
  belongs_to :user

  has_many :comments
  has_many :upvotes

  #uplaoder carrierwave
  mount_uploader :photo, PhotoUploader
end
