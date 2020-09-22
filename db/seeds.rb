# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying the old database"
Category.destroy_all
puts "All the old database has been deleted"

puts "Creating new categories..."
Category.create!(name: "Mes indispensables")
Category.create!(name: "Mes documents")
Category.create!(name: "L'administration & moi")
Category.create!(name: "Les dépenses & moi")
puts "Some categories have been created"

