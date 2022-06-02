puts 'Cleaning database...'
Review.destroy_all
Transaction.destroy_all
Sneaker.destroy_all
User.destroy_all
puts 'Database Clean!'

puts 'Creating users...'
user1 = User.new(username: "batman",
                password: "password123",
                email: "batman@123.com",
                first_name: "John",
                last_name: "Doe",
                address: "888 This Street")
user1.save!

user2 = User.new(username: "wonderer",
                password: "password123",
                email: "wonderer@234.com",
                first_name: "Jane",
                last_name: "Smith",
                address: "111 That Street")
user2.save!

# 20.times do
#   user = User.new(username: Faker::Internet.username(specifier: 5..10),
#                    password: Faker::Internet.password(min_length: 8),
#                    email: Faker::Internet.email,
#                    first_name: Faker::Name.first_name,
#                    last_name: Faker::Name.last_name,
#                    address: Faker::Address.street_address)

#   user.save!
# end

# users = User.all

puts 'Creating sneakers...'
sneaker1 = Sneaker.new(brand: "Nike", price: 250, size: 11, verified: true)
sneaker1.user = user1
sneaker1.save!

sneaker2 = Sneaker.new(brand: "Addidas", price: 88, size: 10, verified: false)
sneaker2.user = user1
sneaker2.save!

sneaker3 = Sneaker.new(brand: "Puma", price: 380, size: 10, verified: false)
sneaker3.user = user1
sneaker3.save!

sneaker4 = Sneaker.new(brand: "NewBalance", price: 90, size: 6, verified: true)
sneaker4.user = user2
sneaker4.save!

sneaker5 = Sneaker.new(brand: "Reebok", price: 420, size: 7, verified: false)
sneaker5.user = user2
sneaker5.save!

# 20.times do
#   sneaker = Sneaker.new(
#     brand: %w[Nike Adidas NewBalance Reebok Puma].sample,
#     price: (50..500).to_a.sample,
#     size: (5..14).to_a.sample,
#     model: %w[Jordans Yeezy NB-500 Classic Cell-king].sample,
#     verified: [true, false].sample
#   )

#   sneaker.user = users.sample
#   sneaker.save!
# end

puts 'Creating transactions...'

  transaction1 = Transaction.new(
    status: "Completed",
    buyer: user1,
    seller: user2,
    sneaker: sneaker1
  )
  transaction1.save!

  transaction2 = Transaction.new(
    status: "Completed",
    buyer: user2,
    seller: user1,
    sneaker: sneaker2
  )
  transaction2.save!

  transaction3 = Transaction.new(
    status: "Completed",
    buyer: user2,
    seller: user1,
    sneaker: sneaker3
  )
  transaction3.save!


  # 10.times do
  # has_review = [true, false].sample
  # transaction = Transaction.new(
  #   status: %w[Pending Completed].sample,
  #   buyer: users.sample,
  #   seller: users.sample,
  #   sneaker: Sneaker.all.sample,
  #   traded_sneaker: [Sneaker.all.sample, nil].sample
  # )

  # if has_review
  #   puts "Creating review for Transaction: ##{transaction.id}..."
  #   review = Review.new(
  #     content: Faker::TvShows::BojackHorseman.quote,
  #     seller_rating: rand(1..5),
  #     buyer_rating: rand(1..5)
  #   )
  #   review.order = transaction
  #   review.save!
  # end

  review1 = Review.new(
    buyer_content: "Awesome seller",
    seller_rating: 5,
    order: transaction1
  )
  # review1.order = "buyer"
  review1.save!

  review2 = Review.new(
    buyer_content: nil,
    seller_content: "Fair buyer",
    seller_rating: nil,
    buyer_rating: 3,
    order: transaction2
  )
  # review2.order = "seller"
  review2.save!

# end

puts "Seeding completed!"
