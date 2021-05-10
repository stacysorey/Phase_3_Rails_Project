# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: "testuser", password: "password")

Journal.create([
  { title: "Journal 1", user_id: user.id},
  { title: "Journal 2", user_id: user.id},
  { title: "Journal 3", user_id: user.id},
  ])

Entry_type.create([
  { type: "Daily Log"}, 
  { type: "Fitness Tracker"}, 
  { type: "Food Tracker"}, 
  { type: "Week Planner"}
])


