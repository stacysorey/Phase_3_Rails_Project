# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Journal.create([
  { id: 1, title: "Journal 1", user_id: 1, created_at: DateTime.now},
  { id: 2, title: "Journal 2", user_id: 1, created_at: DateTime.now},
  { id: 3, title: "Journal 3", user_id: 1, created_at: DateTime.now},
  ])

