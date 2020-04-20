# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.create!(
    username: "hoge",
    email: "hoge@hoge.com",
    password: "password",
    confirmed_at: Time.now
)

49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.org"
  password = "password"
  confirmed_at = Time.now
  User.create!(
    username: name, 
    email: email,
    password: password,
    confirmed_at: confirmed_at
  )
end

# Payments
# users = User.order(:created_at).take(6)
user = User.first
50.times do
  content = Faker::Lorem.sentence(5)
  price = Faker::Number.number(digits: 5)
  user.payments.create!(content: content, price: price)
end