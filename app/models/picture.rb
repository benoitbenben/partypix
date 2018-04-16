class Picture < ApplicationRecord
  #relations
  belongs_to :room
  belongs_to :user

  has_many :comments
  has_many :upvotes

  #uplaoder carrierwave
  mount_uploader :photo, PhotoUploader

  scope :top_10, -> do
    left_outer_joins(:upvotes).
      select("pictures.*, count(upvotes.id) AS upvotes_count").
      group("pictures.id").
      order("upvotes_count DESC").
      limit(10)
  end
end
