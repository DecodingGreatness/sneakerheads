puts 'Cleaning database...'
User.destroy_all
Sneaker.destroy_all

puts 'Creating users...'
20.times do
  user = User.new(username: Faker::Internet.username(specifier: 5..10),
                   password: Faker::Internet.password(min_length: 8),
                   email: Faker::Internet.email,
                   first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   address: Faker::Address.street_address)

  user.save!
end

puts 'Creating sneakers...'
20.times do
  sneaker = Sneaker.new(brand: %w[Nike Adidas NewBalance Reebok Puma].sample,
                          price: (50..500).to_a.sample,
                          size: (5..14).to_a.sample,
                          model: %w[Jordans Yeezy NB-500 Classic Cell-king].sample)

  sneaker.user = User.all.sample
  sneaker.save!
end

# puts 'Creating transactions...'
# 20.times do
#   transaction = transaction.new(brand: %w[Nike Adidas NewBalance Reebok Puma],
#                                 price: (50..500).to_a.sample,
#                                 size: %w[5..14].sample.to_i,
#                                 model: %w[Jordans Yeezy NB-500 Classic Cell-king])

#   sneaker.user = User.all.sample
#   sneaker.save!
# end
