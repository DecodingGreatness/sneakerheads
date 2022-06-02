puts 'Cleaning database...'
Review.destroy_all
Transaction.destroy_all
Sneaker.destroy_all
User.destroy_all
puts 'Database Clean!'

puts 'Creating users...'
20.times do
  user = User.new(username: Faker::Internet.username(specifier: 5..10),
                   password: "123456",
                   email: Faker::Internet.email,
                   first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   address: Faker::Address.street_address)

  user.save!
end


users = User.all

puts 'Creating sneakers...'
20.times do
  sneaker = Sneaker.new(
    brand: %w[Nike Adidas NewBalance Reebok Puma].sample,
    price: (50..500).to_a.sample,
    size: (5..14).to_a.sample,
    model: %w[Jordans Yeezy NB-500 Classic Cell-king].sample,
    verified: [true, false].sample
  )

  sneaker.user = users.first
  sneaker.save!
end

puts 'Creating transactions...'
10.times do
  has_review = [true, false].sample

  transaction = Transaction.new(
    status: %w[Pending Completed].sample,
    buyer: users.sample,
    seller: users.sample,
    sneaker: Sneaker.all.sample,
    traded_sneaker: [Sneaker.all.sample, nil].sample
  )

  transaction.save!

  if has_review
    puts "Creating review for Transaction: ##{transaction.id}..."
    review = Review.new(
      content: Faker::TvShows::BojackHorseman.quote,
      seller_rating: rand(1..5),
      buyer_rating: rand(1..5)
    )
    review.order = transaction
    review.save!
  end
end

puts "Seeding completed!"
