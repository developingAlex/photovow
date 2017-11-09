# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create in this order: users, portfolios, photos, listings, offers, reviews, conversations, messages, 

user1 = User.create!(first_name: 'Ada', last_name: 'Lovelace', email: 'ada@mail.com', password: 'password')
user2 = User.create!(first_name: 'Bob', last_name: 'Martin', email: 'bob@mail.com', password: 'password')
user3 = User.create!(first_name: 'Charlotte', last_name: 'Chaplin', email: 'bride@mail.com', password: 'password')

portfolio1 = Portfolio.create!(bio:'Ada is a photography enthusiast based in Melbourne, she has often photographed at friends and families weddings and is now looking to make some money off the skills she has refined. Studying a bachelor of art currently and so will likely be unavailable to work your wedding if it falls on a weekday, unless it falls on a date that coincides with term breaks from uni. an example of what you will get from Ada is professional quality photos taken in a non-intrusive way on your day, with requests able to be made to focus on particular aspects of the wedding, and by the end of it you will recieve two optical discs(most likely bluray) of the original digital images from the day curated by Ada to remove all the duplicates and failed shots', user: user1, city: 'Melbourne', country: 'Australia')
portfolio2 = Portfolio.create!(bio:'Bob travels around Australia working as a freelance photographer, He has run workshops in community centres teaching volunteers how to take scientific photos and also works on his artistry with a camera which you can see on his blog www.bobsphotos.com', user: user2, city: 'Hobart', country: 'Australia')

listing1 = Listing.create!(owner: user3, title: 'Charlotte and Sams wedding @ city library', venue: 'city library', city: 'Melbourne', country:'Australia', content: 'hey all you great photographers Were looking for someone to work at our wedding, but we dont want to pay too much, ideally the perfect photographer will possess the skills of a professional but with the pricetag of an amateur, we encourage all photographers to apply, and please apply with your absolute lowest price, or else we may go with someone else!!', date: Date.new(2017, 12, 25))

offer1 = Offer.create!(photographer: user1, amount: 3333, listing: listing1)

conversation1 = Conversation.create!(sender: user1, recipient: user3)

message1 = Message.create!(conversation: conversation1, content: 'Hello, Thanks for your offer! Ive had a look at your portfolio and I like what I see! could you please tell me a little bit about what we would get for the price youve quoted? does it include a printed photo album for example?', author: user3)

message2 = Message.create!(conversation: conversation1, content: 'Hey! yeah so my price is not going to include any of those extras that you described, basically what you will get from me is two discs of your digital photos from your day, I provide two discs so that you have a backup, I would suggest you to load them onto an external hdd or something else as a third measure of backup, and remember that depending on the manner in which the optical discs are stored you may want to consider making copies of them after a few years. the discs I use are archival grade and guaranteed for 100 years but that said, it is only if they are stored in proper conditions. hope that answers your questions', author: user1)

message3 = Message.create!(conversation: conversation1, content: 'Hmm ok, so for your price we dont even get a printed album? just a couple of discs?', author: user3)

message4 = Message.create!(conversation: conversation1, content: 'If you really want an album I know of a good supplier that produces great quality printed material, the price for those runs into the hundreds, if you want to go the cheaper route you can always go to officeworks where you can order a printed and bound book but the craftsmanship of such obviously shows as mass produced, let me know im sure we can work something out :)', author: user1)

message5 = Message.create!(conversation: conversation1, content: 'hmm ok, Im not sure which one I would prefer to go with, what do most others go with?', author: user3)

message6 = Message.create!(conversation: conversation1, content: 'The beauty of you getting the original photos on disc is that you have the original copies of the photos and from there you can always arrange to make an album later on down the track. A lot of photographers that provide albums dont give the original high res photos and as such your options to make further copies down the track is reduced to scanning already downscaled images from a printed media. not ideal!', author: user1)

review1 = Review.create!(author: user2, portfolio: portfolio1, content: "Ada was lovely, cant recommend enough! of course theres no such thing as a perfect score so 4 stars it is!", rating: 4.0)

review2 = Review.create!(author: user3, portfolio: portfolio1, content: "Where to begin! Ill cut to the chase, if you dont want to waste your money then dont go with Ada! she was late to our wedding, she knocked over a waiter while they were clearing plates because she was trying to take a photo of one of my bridesmaids and then after all that all we got was two dvd discs! they didnt even come in proper disc cases but were just wrapped in what looked like fish and chip paper! 1 star is all Im giving for that job, future wedding planners I suggest you look elsewhere", rating: 1.0)