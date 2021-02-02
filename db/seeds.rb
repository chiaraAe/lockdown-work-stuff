# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Item.destroy_all
User.destroy_all
puts "Database is clean"

user_1 = User.create!(
    email: 'Chiara@chiara.com',
    password: '123456'
)
puts "User #{user_1.email} created"

user_2 = User.create!(
    email: 'megan@megan.com',
    password: '123456'
)
puts "User #{user_2.email} created"

user_3 = User.create!(
    email: 'huy@huy.com',
    password: '123456'
)
puts "User #{user_3.email} created"

user_4 = User.create!(
    email: 'tobi@tobi.com',
    password: '123456'
)
puts "User #{user_4.email} created"


users = [user_1, user_2, user_3, user_4]

puts "Creating items..."

10.times do
    item = Item.create!(
      category: Item::CATEGORIES.sample,
      title: Faker::Commerce.product_name,
      description: Faker::ChuckNorris.fact,
      price: Faker::Commerce.price,
      user_id: users.sample.id,
    )
    puts "item #{item.id} was created in #{item.category}"
end
puts "Finished!"
