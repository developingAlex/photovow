# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create in this order: users, portfolios, photos, listings, offers, reviews, conversations, messages, 

user1 = User.create!(first_name: 'Ada', last_name: 'Lovelace', email: 'user1@mail.com', password: 'password')
user2 = User.create!(first_name: 'Bob', last_name: 'Martin', email: 'user2@mail.com', password: 'password')
user3 = User.create!(first_name: 'Charlie', last_name: 'Chaplin', email: 'user3@mail.com', password: 'password')

portfolio1 = Portfolio.create!(bio:'Adas portfolio demonstrating that she is a good photographer and capable of photographing weddings', user: user1, city: 'Melbourne', country: 'Australia')
portfolio2 = Portfolio.create!(bio:'Bobs portfolio demonstrating that he is a good photographer and capable of photographing weddings', user: user2, city: 'Hobart', country: 'Australia')

photo1 = Photo.create!(description: 'taken with a canon 700d iso 1200 shutter 1ms aperture F1.1', portfolio: portfolio1)
photo2 = Photo.create!(description: 'taken with a Olympus iso 1000 shutter 2ms aperture F0.1', portfolio: portfolio2)

listing1 = Listing.create!(owner: user3, title: 'Charlie and Samanthas wedding @ city library', venue: 'city library melbourne', city: 'Melbourne', country:'Australia', content: 'hey all you great photographers Were looking for someone to work at our wedding, but we dont want to pay too much', date: Date.new(2017, 11, 03))

offer1 = Offer.create!(photographer: user1, amount: 3333, listing: listing1)
offer2 = Offer.create!(photographer: user2, amount:4000, listing: listing1)

conversation1 = Conversation.create!(sender: user1, recipient: user3)
conversation2 = Conversation.create!(sender: user2, recipient: user3)

message1 = Message.create!(conversation: conversation1, content: 'hey are you there?', author: user1)

message2 = Message.create!(conversation: conversation2, content: 'greetings from user2!', author: user2)