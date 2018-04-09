class Picture < ApplicationRecord
  belongs_to :room
  belongs_to :user

  has_many :comments
  has_many :upvotes
end
