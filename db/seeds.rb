# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create 4 users

puts "Destroy old records"

Profile.destroy_all
User.destroy_all
Listing.destroy_all

puts "I am creating Users"

user_host = User.create(email: "userhost@email.com", password: "password")
user_guest = User.create(email: "userguest@email.com", password: "password")
user_guest2 = User.create(email: "user2guest@email.com", password: "password")

# Create 2 profiles

puts "I am creating Profiles"

Profile.create(first_name: "John", last_name: "Hoe", description: "I am a good host", user: user_host)
Profile.create(first_name: "Mary", last_name: "Eli", description: "Looking to go camping", user_id: user_guest.id)
Profile.create(first_name: "Henry", last_name: "Forrest", description: "I like water", user_id: user_guest2.id)

# Create a listing

puts "I am creating Listings"

listing_host = Listing.create(title: "3-day snow trip", description: "It will be a gewd time in the snow", location: "Mount Buller", user_id: user_host.id)
user_host.listing.create(title: "2-day Wilson Prom", description: "For all beach lovers", location: "Wilson Prom")
user_host.listing.create(title: "3-day hunting", description: "It's going to be a tough one", location: "Moroko")
user_host.listing.create(title: "5-day snowboard trip", description: "shredding", location: "Mount Hotham")
user_host.listing.create(title: "2-day mountain biking", description: "bumpy one", location: "Mount Buller")
user_host.listing.create(title: "4-day Scuba diving trip", description: "I like turtles", location: "Fiji")

# Create a booking

puts "I am creating Bookings"

booking1 = Booking.create(user_id: user_guest.id, listing: listing_host)

# Reviews

Review.create(title: "Good Host", description: "I had a good time", reviewer_id: user_guest.id, reviewee_id: user_host.id)
Review.create(title: "Had a great time", description: "John took me fishing, it was rad", reviewer_id: user_guest2.id, reviewee_id: user_host.id)