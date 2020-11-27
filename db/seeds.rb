# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts "Cleaning database..."
Booking.destroy_all
User.destroy_all
Wand.destroy_all

user_attributes = {
  email: 'albusdumbledore@hogwarts.com',
  password: 'password',
  first_name: 'Albus',
  last_name: 'Dumbledore',
  admin: true
}
user = User.create(user_attributes)

file = URI.open('https://res.cloudinary.com/dsspgcaou/image/upload/v1606187545/tsjvqs9shpbmy441ef6o.jpg')
wand_attributes = {
  wood: "Elder",
  core: "Thestral Tail Hair",
  size: 32,
  price: 95,
  description: "It is said to be the most powerful wand that has ever existed, able to perform feats of magic that would normally be impossible even for the most skilled wizards, such as mending another wand damaged beyond normal magical repair.",
  name: "Elder Wand",
  user: user,
  address: 'Glenfinnan Viaduct, Lochaber, Scotland',
}
wand = Wand.new(wand_attributes)
wand.photos.attach(io: file, filename: 'elderwand.png', content_type: 'image/jpg')


puts "Created #{user.first_name} #{user.last_name} with wand #{wand.name}"

file2 = URI.open('https://res.cloudinary.com/dsspgcaou/image/upload/v1606188301/cedric-diggory-wand-character-edition--mw-116267-1_rdjwa6.jpg')
wand_attributes2 = {
  wood: "Ash",
  core: "Unicorn Hair",
  size: 26,
  price: 29,
  description: "This wand was \"pleasantly springy\"; hair from particularly fine male unicorn (seventeen hands high).",
  name: "Cedric Diggory's Wand",
  user: user,
  address: 'Glencoe, Argyll, Scotland'
}
wand2 = Wand.new(wand_attributes2)
wand2.photos.attach(io: file2, filename: 'cedricdiggory.png', content_type: 'image/jpg')
wand2.save

puts "Created #{user.first_name} #{user.last_name} with wand #{wand2.name}"

file3 = URI.open('https://res.cloudinary.com/dsspgcaou/image/upload/v1606188605/latest_h57lmf.png')
wand_attributes3 = {
  wood: "Walnut",
  core: "Dragon Heartstring",
  size: 27,
  price: 34,
  description: "This wand is described as \"unyielding;\" passed into the possession of Hermione Granger after the Skirmish at Malfoy Manor in 1998.",
  name: "Bellatrix Lestrange's Wand",
  user: user,
  address: 'Freshwater West, Pembrokeshire, Wales'
}
wand3 = Wand.new(wand_attributes3)
wand3.photos.attach(io: file3, filename: 'bellatrixlestrange.png', content_type: 'image/png')
wand3.save

puts "Created #{user.first_name} #{user.last_name} with wand #{wand3.name}"


user_attributes2 = {
  email: 'harrypotter@hogwarts.com',
  password: 'password',
  first_name: 'Harry',
  last_name: 'Potter'
}
user2 = User.create(user_attributes2)

file4 = URI.open('https://res.cloudinary.com/dsspgcaou/image/upload/v1606188711/wpg15jeh8qshgdgcyzog.jpg')
wand_attributes4 = {
  wood: "Birch",
  core: "Dragon Heartstring",
  size: 17,
  price: 12,
  description: "This wand is described as \"unusually short;\" broken by a centaur's hoof in June 1996 in the Forbidden Forest.",
  name: "Dolores Umbridge's Wand",
  user: user2,
  address: 'Durham Cathedral, Durham, England'
}
wand4 = Wand.new(wand_attributes4)
wand4.photos.attach(io: file4, filename: 'doloresumbridge.png', content_type: 'image/jpg')
wand4.save

puts "Created #{user2.first_name} #{user2.last_name} with wand #{wand4.name}"

file5 = URI.open('https://res.cloudinary.com/dsspgcaou/image/upload/v1606188794/cjtddcebh1csg3jdh6dm.png')
wand_attributes5 = {
  wood: "Hawthorn",
  core: "Unicorn Hair",
  size: 21,
  price: 27,
  description: "This wand passed into the possession of Harry Potter after the Skirmish at Malfoy Manor in 1998 until Harry came into possession of the Elder Wand and mended his first wand.",
  name: "Draco Malfoy's Wand",
  user: user2,
  address: 'Bodleian Library and Christ Church College, Oxford, England'
}
wand5 = Wand.new(wand_attributes5)
wand5.photos.attach(io: file5, filename: 'dracomalfoy.png', content_type: 'image/png')
wand5.save

puts "Created #{user2.first_name} #{user2.last_name} with wand #{wand5.name}"

file6 = URI.open('https://res.cloudinary.com/dsspgcaou/image/upload/v1606188878/uahpyyxouxza5q6rhykt.png')
wand_attributes6 = {
  wood: "Rosewood",
  core: "Veela Hair",
  size: 19,
  price: 27,
  description: "In this wand the core is a hair from Fleur's grandmother, who was a Veela.",
  name: "Fleur Delacour's Wand",
  user: user2,
  address: 'King’s Cross Station, London, England'
}
wand6 = Wand.new(wand_attributes6)
wand6.photos.attach(io: file6, filename: 'fleurdelacour.png', content_type: 'image/png')
wand6.save

puts "Created #{user2.first_name} #{user2.last_name} with wand #{wand6.name}"

user_attributes3 = {
  email: Faker::Internet.email,
  password: 'password',
  first_name: Faker::Movies::HarryPotter.character.split(' ').first,
  last_name: Faker::Movies::HarryPotter.character.split(' ').last
}
user3 = User.create(user_attributes3)

file7 = URI.open('https://res.cloudinary.com/dsspgcaou/image/upload/v1606189188/irvsbcfgtasrf1qr16md.jpg')
file8 = URI.open('https://res.cloudinary.com/dsspgcaou/image/upload/v1606189543/ybnaxerta8kdv8y4wf4w.jpg')
wand_attributes7 = {
  wood: "Yew",
  core: "Pheonix Feather",
  size: 18,
  price: 45,
  description: "This wand is \"brother\" to Harry Potter's wand — the core tail feathers are both from Fawkes.",
  name: "Tom Riddle's Wand",
  user: user2,
  address: 'Leadenhall Market, London, England'
}
wand7 = Wand.new(wand_attributes7)
wand7.photos.attach(io: file7, filename: 'tomriddle.png', content_type: 'image/jpg')
wand7.photos.attach(io: file8, filename: 'tomriddle2.png', content_type: 'image/jpg')
wand7.save

puts "Created #{user3.first_name} #{user3.last_name} with wand #{wand7.name}"
