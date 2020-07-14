# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
User.create(username: "Jay", password: "12345")
15.times do
  User.create(
    username: Faker::TvShows::Friends.character.split(/ /).join(),
    password: 'helloworld',
    avatar: Faker::Avatar.image,
    bio: Faker::TvShows::Friends.quote
  )
end