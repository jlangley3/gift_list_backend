# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ContactInterest.destroy_all
Gift.destroy_all
Interest.destroy_all
Reminder.destroy_all
Contact.destroy_all
User.destroy_all
Event.destroy_all
Faker::Name.unique.clear # Clears used values for Faker::Name
Faker::UniqueGenerator.clear # Clears used values for all generators

u1 = User.create(username: "Jay", password: "test", first_name: "Jay", last_name: "Slay", avatar: "https://vignette.wikia.nocookie.net/fire-brigade-of-flames/images/f/f0/Ogun_Montgomery.png/revision/latest/scale-to-width-down/340?cb=20200711161516")
u2 = User.create(username: "Mae", password: "test", first_name: "Mae", last_name: "Slay", avatar: "https://pm1.narvii.com/7083/2a6e996164e1f94e572eb0043b1a7fa512989974r1-422-750v2_128.jpg")

e1 = Event.create(title: "Chirtsmas", date: DateTime.new(2020, 12, 25), budget: 210, user: u1)
e2 = Event.create(title: "Burt's Birthday", date: DateTime.new(2020, 9, 9), budget: 200, user: u1)

e3 = Event.create(title: "Chirtsmas", date: DateTime.new(2020, 12, 24), budget: 310, user: u2)
e4 = Event.create(title: "Mom's Birthday", date: DateTime.new(2020, 8, 8), budget: 300, user: u2)

15.times do
  Contact.create(
    name: Faker::Name.unique.name,
    birthday:DateTime.new(1990, 9, 9),
    # avatar: Faker::Avatar.image,
    user: u1
  )
end

c1 = Contact.create(
  name: Faker::Name.unique.name,
  birthday:DateTime.new(1920, 6, 9),
  # avatar: Faker::Avatar.image,
  user: u1
)

2.times do
  Gift.create(
    name: Faker::Name.unique.name,
    price: Faker::Number.within(range: 1..500),
    given: Faker::Boolean.boolean,
    rating: 0,
    event: e1,
    contact: c1,
    link: "https://community.atlassian.com/t5/image/serverpage/image-id/51337i1F023F1C57E73FEC?v=1.0",
  )
end

15.times do
  Interest.create(
    name: Faker::Name.unique.name
)
end


  r1 = Reminder.create(
    title: "Christmas",
    start_date: DateTime.new(2020, 12, 24),
    end_date: DateTime.new(2020, 12, 28),
    repeating: true,
    event: e1)

  r2 = Reminder.create(
    title: "Moms Birthday",
    start_date: DateTime.new(2020, 8, 8),
    end_date: DateTime.new(2020, 8, 8),
    repeating: true,
    event: e1)

