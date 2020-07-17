# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all


u1 = User.create(username: "Jay", password: "test", first_name: "Jay", last_name: "Slay", avatar: "https://vignette.wikia.nocookie.net/fire-brigade-of-flames/images/f/f0/Ogun_Montgomery.png/revision/latest/scale-to-width-down/340?cb=20200711161516")
u2 = User.create(username: "Mae", password: "test", first_name: "Mae", last_name: "Slay", avatar: "https://pm1.narvii.com/7083/2a6e996164e1f94e572eb0043b1a7fa512989974r1-422-750v2_128.jpg")

Event.create(title: "Chirtsmas", date: DateTime.new(2020, 12, 25), budget: 210, user: u1)
Event.create(title: "Burt's Birthday", date: DateTime.new(2020, 9, 9), budget: 200, user: u1)

Event.create(title: "Chirtsmas", date: DateTime.new(2020, 12, 24), budget: 310, user: u2)
Event.create(title: "Mom's Birthday", date: DateTime.new(2020, 8, 8), budget: 300, user: u2)
# 15.times do
#   User.create(
#     username: Faker::TvShows::Friends.character.split(/ /).join(),
#     password: 'helloworld',
#     avatar: Faker::Avatar.image
#     ,
#     bio: Faker::TvShows::Friends.quote
#   )
# end