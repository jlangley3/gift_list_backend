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

e1 = Event.create(title: "Chirtsmas", start_date: Date.new(2020, 12, 25), end_date: Date.new(2020, 12, 25), budget: 210, user: u1)
e2 = Event.create(title: "Burt's Birthday", start_date: Date.new(2020, 7, 31), end_date: Date.new(2020, 7, 31), budget: 100, user: u1)
e3 = Event.create(title: "Mothers Day", start_date: Date.new(2021, 5, 9), end_date: Date.new(2021, 5, 9), budget: 210, user: u1)
e4 = Event.create(title: "Jim's Birthday", start_date: Date.new(2020, 9, 9), end_date: Date.new(2020, 9, 9), budget: 300, user: u1)

e5 = Event.create(title: "Chirtsmas", start_date: Date.new(2020, 12, 25), end_date: Date.new(2020, 12, 25), budget: 310, user: u2)
e6 = Event.create(title: "Mom's Birthday", start_date: Date.new(2020, 8, 8), end_date: Date.new(2020, 8, 8), budget: 300, user: u2)
e7 = Event.create(title: "Hanukkah", start_date: Date.new(2020, 12, 10), end_date: Date.new(2020, 12, 18), budget: 500, user: u1)
e8 = Event.create(title: "Hanukkah", start_date: Date.new(2020, 12, 10), end_date: Date.new(2020, 12, 18), budget: 500, user: u2)

5.times do
  Contact.create(
    name: Faker::Name.unique.name,
    birthday:Date.new(1990, 9, 9),
    avatar: Faker::Avatar.image,
    kind: "family",
    user: u1
  )
end
5.times do
  Contact.create(
    name: Faker::Name.unique.name,
    birthday:Date.new(1989, 12, 2),
    avatar: Faker::Avatar.image,
    kind: "friend",
    user: u1
  )
end
5.times do
  Contact.create(
    name: Faker::Name.unique.name,
    birthday:Date.new(1986, 6, 9),
    avatar: Faker::Avatar.image,
    kind: "Co-Worker",
    user: u2
  )
end
5.times do
  Contact.create(
    name: Faker::Name.unique.name,
    birthday:Date.new(1930, 11, 9),
    kind: "family",
    avatar: Faker::Avatar.image,
    user: u2
  )
end

c1 = Contact.create(
  name: "Penny Proud",
  birthday:Date.new(1986, 6, 9),
  kind: "family",
  avatar: "https://m.media-amazon.com/images/M/MV5BMTlhMDMxZDItYzViOC00ODIwLWI3ZGMtNjVkODE3MTVmODg2XkEyXkFqcGdeQXVyNTM3MDMyMDQ@._V1_UY1200_CR485,0,630,1200_AL_.jpg",
  user: u1
)

c2 = Contact.create(
  name: "Son Goku",
  birthday: Date.new(737, 4, 6),
  kind: "I dont Know this person",
  avatar: "https://i.pinimg.com/originals/04/32/37/043237fa1ef2024cf0019523caf9e2eb.png",
  user: u1
)

c3 = Contact.create(
  name: "Popeye",
  birthday: Date.new(1920, 6, 9),
  kind: "Co-Worker",
  avatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTbZxUm9rNGTpYXo5TYTzokRYnoyKEdwWG59w&usqp=CAU",
  user: u1
)

c4 = Contact.create(
  name: "Jasmine",
  birthday: Date.new(1920, 6, 9),
  kind: "friend",
  avatar: "https://lumiere-a.akamaihd.net/v1/images/gallery_princess_jasmine_2_1abea4ca.jpeg?region=0%2C0%2C2181%2C1223",
  user: u1
)

2.times do
  Gift.create(
    name: Faker::Device.model_name,
    price: Faker::Number.within(range: 1..500),
    given: Faker::Boolean.boolean,
    rating: 0,
    event: e1,
    contact: c1,
    link: ""
  )
end

2.times do
  Gift.create(
    name: Faker::Device.model_name,
    price: Faker::Number.within(range: 1..500),
    given: Faker::Boolean.boolean,
    rating: 0,
    event: e1,
    contact: c1,
    link: ""
  )
end


 i1 = Interest.create(name: "Sports")
 i2 = Interest.create(name: "Music")
 i3 = Interest.create(name: "Cars")
 i4 = Interest.create(name: "Reading")
 i5 = Interest.create(name: "Movies")
 i6 = Interest.create(name: "Cooking")


ci1 = ContactInterest.create(contact: c1, interest: i1)
ci2 = ContactInterest.create(contact: c2, interest: i3)
ci3 = ContactInterest.create(contact: c3, interest: i4)
ci4 = ContactInterest.create(contact: c4, interest: i2)
ci5 = ContactInterest.create(contact: c1, interest: i6)
ci6 = ContactInterest.create(contact: c2, interest: i5)


  r1 = Reminder.create(
    title: "Christmas",
    start_date: Date.new(2020, 11, 12),
    end_date: Date.new(2020, 11, 12),
    repeating: true,
    event: e1)

  r2 = Reminder.create(
    title: "Moms Birthday",
    start_date: Date.new(2020, 8, 8),
    end_date: Date.new(2020, 8, 8),
    repeating: true,
    event: e1)

