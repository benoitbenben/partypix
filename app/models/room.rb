class Room < ApplicationRecord
  belongs_to :user

  # direct
  has_many :pictures
  accepts_nested_attributes_for :pictures

  has_many :memberships

  # through membership table
  has_many :users, through: :memberships
  # has_many :contributors, through: :memberships, source: :user

  # through pictures pour le nombre de comments
  has_many :comments, through: :pictures

  # through pictures pour le nombre de votes
  has_many :upvotes, through: :pictures
end

