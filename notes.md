[x] 1. github omniauth
[x] 2. many to many
[] 3. rails amusement park css
[] 4. credit card transactions
        add admin to user model to edit menu items and bentos
        icons for bento boxes
        kpi tracking
[x] 5. push to github

[x] 6. rails generate models, controllers, views
rails g resource Account name:string payment_status:string --no-test-framework
rails g resource Bentobox name:string type:string --no-test-framework
rails g resource User name:string email:string password:digest
rails g resource MenuItem name:string price:integer type:string bentobox_id:integer user_id integer--no-test-framework

menu_item type: side or main entree
build your own bento versus premade items together?
Bento type (lunch or dinner for example)
[x] 7. build routes

[x] 8. get gems
[] 9. compare with amusement park

[x] 10. sessions controller for login
[x] 11. user, bento, menu models

not sure user needs a show page, can do straight to menu? or from show page link to menu

12. [x] index for menu
    add relations to bentos and menu items and seed 
13. [x] veggie options, gluten free
14. [] can have 2 side extra instead of entree
15. [x] snack section - omochi, onigiri
16. [x] add validations to models
17. [] add user model back in
18. [x] order bento with entree first
19. [] refactor total price

# rachel_bento.menu_items << [spicy_tofu, white_rice, veg_temp, avo_roll, j_salad, tamagoyaki]
# kiele_bento.menu_items << [miso_butterfish, white_rice, gyoza, cali_roll, miso_soup, tamagoyaki]
# hoodie_bento.menu_items << [miso_salmon, seaweed_salad, shrimp_veg_temp, avo_roll, j_salad, miso_soup]
# bananas_bento.menu_items << [chicken_teriyaki, veg_temp, gyoza, j_salad, miso_soup]
# snack_bento.menu_items << [gyoza, miso_soup, omochi, onigiri, green_tea]

# rachel = User.create(name: 'Rachel', email: 'rachel@rachie.com', password: 'password')
# kiele = User.create(name: 'Kiele', email: 'kiele@rachie.com', password: 'password')
# hoodie = User.create(name: 'Mount Hoodie', email: 'mthoodie@rachie.com', password: 'password')

# rachel.bentoboxes << [rachel_bento]
# kiele.bentoboxes << [kiele_bento, bananas_bento, snack_bento]
# hoodie.bentoboxes << [hoodie_bento]