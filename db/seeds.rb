# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: "test", email: "test@example.com", username: "testuser", password: "password")

Journal.create([
  { title: "Journal 1", user_id: user.id},
  { title: "Journal 2", user_id: user.id},
  { title: "Journal 3", user_id: user.id},
  ])

#created journals twice? is this bc I seeded twice?

EntryType.create([
  { category: "Daily Log"}, 
  { category: "Fitness Tracker"}, 
  { category: "Food Tracker"}, 
  { category: "Week Planner"},
])

#figure out how to assign entry_type_id to entries and connect the ^ above categories to the entry_type_id??

Entry.create([
  { title: "entry 1", user_id: user.id, journal_id: journal.id, date: Date.today, description: "this is a test entry to see if this is working!!"}
  { title: "entry 2", user_id: user.id, journal_id: journal.id, date: Date.today, description: "this is a test entry to see if this is working!!"}
  { title: "entry 3", user_id: user.id, journal_id: journal.id, date: Date.today, description: "this is a test entry to see if this is working!!"}
  { title: "entry 4", user_id: user.id, journal_id: journal.id, date: Date.today, description: "this is a test entry to see if this is working!!"}
  { title: "entry 5", user_id: user.id, journal_id: journal.id, date: Date.today, description: "this is a test entry to see if this is working!!"}
])
#NOT WORKING
