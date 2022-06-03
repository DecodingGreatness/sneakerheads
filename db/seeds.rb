# require "open-uri"

# file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
# article = Article.new(title: 'NES', body: "A great console")
# article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

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
users = User.all

puts 'Creating sneakers...'

# file = URI.open(asset_path 'images/a0fxd7saxlav374ibgpfrt7ip416.jpg')
sneaker1 = Sneaker.new(brand: "Nike", price: 250, size: 11, verified: true)
sneaker1.user = user1
# sneaker1.photos.attach(io: file, filename: 'a0fxd7saxlav374ibgpfrt7ip416.jpg', content_type: 'image/jpg')
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
