# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new
user.email = 'test@example.com'
user.password = 'valid_password'
user.password_confirmation = 'valid_password'
user.admin = true
user.save!

other_user = User.new
other_user.email = 'othertest@example.com'
other_user.password = 'password'
other_user.password_confirmation = 'password'
other_user.save!

categories = ['Breakfast', 'Main Dish', 'Snack', 'Dessert']
50.times do
  content = Faker::Food.description
  name = Faker::Food.dish
  category = categories[rand(4)]
  steps = Faker::Lorem.paragraph(sentence_count: 15)
  user.recipes.create!(name: name, description: content, category: category, steps: steps)
end

10.times do
  content = Faker::Food.description
  name = Faker::Food.dish
  category = categories[rand(4)]
  steps = Faker::Lorem.paragraph(sentence_count: 15)
  other_user.recipes.create!(name: name, description: content, category: category, steps: steps)
end
