# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create(
  name: "Bilal Budhani",
  email: "hey@bilal.dev",
  password: "admin@123",
  password_confirmation: "admin@123",
  confirmed_at: Time.zone.now
)

puts "Seeding complete 👍"