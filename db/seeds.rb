# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Activity.destroy_all
Availability.destroy_all
Booking.destroy_all
Employee.destroy_all
Guest.destroy_all
#don't fuck with the order above

sandra = Employee.create!(first_name: "Sandra", last_name: "Smith", role: "Surf Instructor", email: "sandra@gmail.com", password: "russia")
surfing = Activity.create!(name:"surfing", location: "tahiti", description: "reef", capacity: 2, price: 20, duration: 3, category: "Surf", employee_id: sandra.id)
monday = Availability.create!(activity_id: surfing.id, employee_id: sandra.id, start_time: "2017-11-23T12:00:00.000Z", end_time: "2017-11-23T13:00:00.000Z")
sam = Guest.create!(first_name: "Sam", last_name: "Willis", email: "s@gmail.com", password: "donkey" )
sambook = Booking.create!(availability_id: monday.id, guest_id: sam.id, no_ppl: "2")
chatroom = Chatroom.create!(availability_id: monday.id)
