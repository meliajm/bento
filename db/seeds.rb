# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MenuItem.create(name: 'Miso Butterfish', price: 7, type: 'Entree')
MenuItem.create(name: 'Miso Salmon', price: 7, type: 'Entree')
MenuItem.create(name: 'Chicken Teriyaki', price: 7, type: 'Entree')
MenuItem.create(name: 'Tonkatsu', price: 7, type: 'Entree')
MenuItem.create(name: 'Gyudon', price: 7, type: 'Entree')
MenuItem.create(name: 'Spicy Tofu', price: 7, type: 'Entree')

MenuItem.create(name: 'White Rice', price: 2, type: 'Side')
MenuItem.create(name: 'Vegetable Tempura', price: 2, type: 'Side')
MenuItem.create(name: 'Shrimp&Vegetable Tempura', price: 2, type: 'Side')
MenuItem.create(name: 'Gyoza', price: 2, type: 'Side')
MenuItem.create(name: 'California Roll', price: 2, type: 'Side')
MenuItem.create(name: 'Avocado Roll', price: 2, type: 'Side')
MenuItem.create(name: 'Seaweed Salad', price: 2, type: 'Side')
MenuItem.create(name: 'Japanese Salad', price: 2, type: 'Side')
MenuItem.create(name: 'Miso Soup', price: 2, type: 'Side')
MenuItem.create(name: 'Tamagoyaki', price: 2, type: 'Side')

MenuItem.create(name: 'Omochi', price: 2, type: 'Snack')
MenuItem.create(name: 'Onigiri', price: 2, type: 'Snack')

MenuItem.create(name: 'Hot Green Tea', price: 2, type: 'Drink')

Bentobox.create(name: 'Rachel BrusselSprout', type: 'Dinner')

