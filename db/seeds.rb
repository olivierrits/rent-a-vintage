# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.last

car1 = Car.new(
  { name: 'Big Johnny',
    brand: 'VW',
    model: 'Coccinelle',
    year: 1965,
    price: 100,
    description: 'little amazing car' }
)

car2 = Car.new(
  { name: 'Little fella',
    brand: 'Citroen',
    model: '2CV',
    year: 1974,
    price: 90,
    description: 'ideal picnic car' }
)

car3 = Car.new(
  { name: 'Windy',
    brand: 'Triumph',
    model: 'Spitfire',
    year: 1978,
    price: 120,
    description: 'perfect roadster' }
)

car1.user = user
car2.user = user
car3.user = user

car1.save!
car2.save!
car3.save!

