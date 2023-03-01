# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Create time slots for seats
TimeSlot.create(start_time: "10:00am", end_time: "12:00pm")
TimeSlot.create(start_time: "2:00pm", end_time: "4:00pm")
TimeSlot.create(start_time: "6:00pm", end_time: "8:00pm")
TimeSlot.create(start_time: "10:00pm", end_time: "12:00am")
