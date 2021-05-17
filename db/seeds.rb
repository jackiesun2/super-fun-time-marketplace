# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create 4 users

userHost = User.create(email: "userhost@email.com", password: "password")
userHost2 = User.create(email: "userhost2@email.com", password: "password")
userGuest = User.create(email: "userguest@email.com", password: "password")
userGuest2 = User.create(email: "userguest2@email.com", password: "password")

# Create 2 profiles

Profile.create(first_name: "John", last_name: "Mathew", description: "I am a good host", user: userHost)
# Profile.create(first_name: "Mary", last_name: "Eli", description: "Looking to go camping", user: userGuest)

# Create a listing

# listing1 = Listing.create(title: "3-day snow trip", description: "It will be a gewd time in the snow", location: "Mount Buller", user: userHost)

# Create a booking

# booking1 = Booking.create(user: userGuest, listing: listing1)

# Reviews