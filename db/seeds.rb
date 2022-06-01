# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Cleaning database...'
User.destroy_all
puts 'Creating sneakers...'

20.times do
  @user = User.new(username: Faker::Internet.username(specifier: 5..10),
                   password: Faker::Internet.password(min_length: 8),
                   email: Faker::Internet.email,
                   first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   address: Faker::Address.street_address)
end

# puts 'Cleaning database...'
# Sneaker.destroy_all
# puts 'Creating sneakers...'

# 20.times do
#   @sneaker = Sneaker.new(brand: %w[Nike Adidas NewBalance Reebok Puma],
#                           price: (50..500).to_a.sample,
#                           size: %w[5..14].sample.to_i,
#                           model: %w[Jordans Yeezy NB-500 Classic Cell-king])
# end
