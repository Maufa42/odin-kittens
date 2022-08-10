# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"


# Kitten.create(name: "Shoiab", age: "22", cuteness: "low", softness: "High")
# Kitten.create(name: "Ganesh", age: "20", cuteness: "high", softness: "moderate")
# Kitten.create(name: "Aakash", age: "21", cuteness: "moderate", softness: "moderate")
# Kitten.create(name: "Shoiab", age: "32", cuteness: "high", softness: "low")

cute = %w[low moderate high]

10.times do
  Kitten.create(name: Faker::Name.unique.name, age: Faker::Number.between(from: 18, to: 45), cuteness: cute.shuffle.last, softness:cute.shuffle.first)
end