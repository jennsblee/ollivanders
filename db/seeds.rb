# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
User.destroy_all
Wand.destroy_all


3.times do
  user_attributes = {
    email: Faker::Internet.email,
    password: 'password',
    first_name: Faker::Movies::HarryPotter.character.split(' ').first,
    last_name: Faker::Movies::HarryPotter.character.split(' ').last
  }
  user = User.create(user_attributes)

    5.times do
      wand_attributes = {
        wood: Wand::WOOD_TYPES.sample,
        core: Wand::CORE_TYPES.sample,
        size: rand(1..12),
        price: rand(25..100),
        description: Faker::Movies::HarryPotter.quote,
        name: Faker::Movies::HarryPotter.house,
        user: user,

      }

    puts "Created #{user.first_name} #{user.last_name} with wand #{wand.name}"
    end
end



