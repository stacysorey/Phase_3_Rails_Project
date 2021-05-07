# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Journal.create([
  { title: "Journal 1"},
  { title: "Journal 2"},
  { title: "Journal 3"},
  ])

Entry.create([
  { title: "Journal Entry 1", category: "Daily Log", description: "Test description", user_id: 1, date: Date.today},
])