# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user = User.first

car1 = Car.new(
  { name: 'Big Johnny',
    brand: 'VW',
    model: 'Coccinelle',
    year: 1965,
    price: 100,
    description: 'little amazing car',
    address: 'Rue Haute 179, 1000 Bruxelles' }
)

car2 = Car.new(
  { name: 'Little fella',
    brand: 'Citroen',
    model: '2CV',
    year: 1974,
    price: 90,
    description: 'ideal picnic car',
    address: 'Rue Gheude 56, 1070 Anderlecht' }
)

car3 = Car.new(
  { name: 'Windy',
    brand: 'Triumph',
    model: 'Spitfire',
    year: 1978,
    price: 120,
    description: 'perfect roadster',
    address: 'Rue Dieudonné Lefèvre 37, 1020 Bruxelles' }
)

car1.user = user
car2.user = user
car3.user = user

car1.save!
car2.save!
car3.save!

puts 'Creating 100 fake user with password "password"...'
10.times do
  user = User.new(
    { email:    Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    license_number: rand(10_000_000..99_999_999) })
  user.save!
end

User.all.each do |user|
  number = rand(0..3)
  number.times do
    car = Car.new(
      { name: Faker::Marketing.buzzwords,
      brand: Faker::Vehicle.make,
      model: Faker::Vehicle.model,
      year: rand(1940..2000),
      address: ["Rue Scarron 50, 1050 Ixelles", "Avenue Paul Dejaer 29, 1060 Brussels", "Avenue Van Volxem 354, 1190 Forest", "Rue de la Régence 3, 1000 Bruxelles", "Rue Américaine 25, 1060 Bruxelles"].sample,
      description: Faker::ChuckNorris.fact,
      price: rand(18..104) * 5 } )
    car.user = user
    car.save!
  end
end
puts 'Finished!'
