MenuItem.destroy_all
Bentobox.destroy_all

miso_butterfish = MenuItem.create(name: 'Miso Butterfish', price: 7, item_type: 'Entree')
miso_salmon = MenuItem.create(name: 'Miso Salmon', price: 7, item_type: 'Entree')
chicken_teriyaki = MenuItem.create(name: 'Chicken Teriyaki', price: 7, item_type: 'Entree')
tonkatsu = MenuItem.create(name: 'Tonkatsu', price: 7, item_type: 'Entree')
gyudon = MenuItem.create(name: 'Gyudon', price: 7, item_type: 'Entree')
spicy_tofu = MenuItem.create(name: 'Spicy Tofu', price: 7, item_type: 'Entree')
white_rice = MenuItem.create(name: 'White Rice', price: 2, item_type: 'Side')
veg_temp = MenuItem.create(name: 'Vegetable Tempura', price: 2, item_type: 'Side')
shrimp_veg_temp = MenuItem.create(name: 'Shrimp&Vegetable Tempura', price: 2, item_type: 'Side')
gyoza = MenuItem.create(name: 'Gyoza', price: 2, item_type: 'Side')
cali_roll = MenuItem.create(name: 'California Roll', price: 2, item_type: 'Side')
avo_roll = MenuItem.create(name: 'Avocado Roll', price: 2, item_type: 'Side')
seaweed_salad = MenuItem.create(name: 'Seaweed Salad', price: 2, item_type: 'Side')
j_salad = MenuItem.create(name: 'Japanese Salad', price: 2, item_type: 'Side')
miso_soup = MenuItem.create(name: 'Miso Soup', price: 2, item_type: 'Side')
tamagoyaki = MenuItem.create(name: 'Tamagoyaki', price: 2, item_type: 'Side')
omochi = MenuItem.create(name: 'Omochi', price: 2, item_type: 'Snack')
onigiri = MenuItem.create(name: 'Onigiri', price: 2, item_type: 'Snack')
green_tea = MenuItem.create(name: 'Hot Green Tea', price: 2, item_type: 'Drink')

rachel = Bentobox.create(name: 'Rachel BrusselSprout', bento_type: 'Dinner')
kiele = Bentobox.create(name: "That's My Sister's", bento_type: 'Dinner')
hoodie = Bentobox.create(name: "Mt Hoodie", bento_type: 'Dinner')
bananas = Bentobox.create(name: "Boston Bananas", bento_type: 'Lunch')
snack = Bentobox.create(name: "Snack-a-lack", bento_type: 'Other')

rachel.menu_items << [spicy_tofu, white_rice, veg_temp, avo_roll, j_salad, tamagoyaki]
kiele.menu_items << [miso_butterfish, white_rice, gyoza, cali_roll, miso_soup, tamagoyaki]
hoodie.menu_items << [miso_salmon, seaweed_salad, shrimp_veg_temp, avo_roll, j_salad, miso_soup]
bananas.menu_items << [chicken_teriyaki, veg_temp, gyoza, j_salad, miso_soup]
snack.menu_items << [gyoza, miso_soup, omochi, onigiri, green_tea]

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)