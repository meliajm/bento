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
rails g resource User name:string email:string password:digest --no-test-framework
rails g resource MenuItem name:string price:integer type:string bentobox_id:integer user_id:integer--no-test-framework
rails g resource Order bentobox_id:integer user_id:integer--no-test-framework


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
17. [x] add user model back in
18. [x] order bento with entree first
19. [] refactor total price
20. [] add admin to user


21. [] make login

[x] so here's the plan
user goes to bento box new page
from this form user can add menu items from checkboxes 
then creates new bento box

[x] total price is not calculated for bentos created this way - got this figured out

[x] user then goes to order page
can select bentos from checkboxes again
goes to show page of order with edit link
places order

[x] need to figure out how to save array of ids to bentos and orders
accepts_nested_attributes_for :categories


[] only admin can make new menu items
[x] partials

how is bento associating menu items and what is the deal with order where it is not?!!!!

[x] crud for bento boxes
[x] security

[x] update for bento is not deleting items from list

----------------------------------------------------------------------------------
[] user can login through github too  // ♥ git commit -m 'can edit your order' 
    [x] user from github gets stored to db
    [] can view user show page


omniauth user
redirect not working for users show

rails g migration CreateBentoboxMenuItemJoinTable bento_menu_items
rails g migration CreateBentoboxOrderJoinTable bento_orders

rails g migration CreateMediaJoinTable artists musics:uniq

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
<!--<li>Price: <%= menu_item.price %></li>
            <li>Item Type: <%= menu_item.item_type %></li>
            <% bento.menu_items.order_array_by_item_type.each do |menu_item| %>
            --> 