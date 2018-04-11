# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Partypix-Cleaning all tables of the database...'
Picture.destroy_all
Comment.destroy_all
Membership.destroy_all
Room.destroy_all
Upvote.destroy_all
User.destroy_all

puts 'Partypix-Creating users'

simon = User.create!(
  email: "simon@test.com",
  password: "123456",
  first_name: "Simon",
  last_name: "Wagon",
  avatar: File.open(Rails.root.join("db/fixtures/users/simon.jpg")),
  city: "Nantes",
  phone: "0203040506",
  nickname: "simon"
  )

rose = User.create!(
  email: "rose@test.com",
  password: "123456",
  first_name: "Rose",
  last_name: "Wagon",
  avatar: File.open(Rails.root.join("db/fixtures/users/rose.jpg")),
  city: "Nantes",
  phone: "0203040506",
  nickname: "rose"
  )

benoit = User.create!(
  email: "benoit@test.com",
  password: "123456",
  first_name: "Benoit",
  last_name: "Wagon",
  avatar: File.open(Rails.root.join("db/fixtures/users/benoit.jpg")),
  city: "Nantes",
  phone: "0203040506",
  nickname: "ben"
  )

puts 'Partypix-Creating rooms for users'























