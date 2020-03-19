https://meliajm.github.io/adventure_bento_for_rails

[x] 1. github omniauth
[x] 2. many to many
[x] 3. rails amusement park css
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
rails g migration add_uid_to_users uid:integer

rails g migration RemoveCountryFromSampleApps country:string
rails g migration RemoveBentoboxIdFromOrder bentobox_id:integer
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


21. [x] make login

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


[x] partials

how is bento associating menu items and what is the deal with order where it is not?!!!!

[x] crud for bento boxes
[x] security

[x] update for bento is not deleting items from list

----------------------------------------------------------------------------------
[x] user can login through github too  // ♥ git commit -m 'can edit your order' 
    [x] user from github gets stored to db
    [x] can view user show page
    [x] can make order

[x] user can go to login page to login #not omniauth user
    [x] create login route
    [x] create login view

[x] nested links
[] only admin can make new menu items
    [] add column to user called admin - migration
    [] rails db:migrate
    [] user has checkbox for admin
    [] admin user cannot make orders?
    [] add conditionals to menu new controller
[x] menu items crud
[] description of each menu item

[] search methods - in partials lessons/labs?

[x] can view user show page in browser
[x] order can be deleted - need to add link to order index or show page?
[x] add validation so bento box must have at least one item
[x] drop down for lunch/dinner and snack/entree/side/drink

[x] place order 
[x] add order price to user order index page
[x] delete menu_item not available



[?????????] form flash error messages
[????????] ordered the list of menu items with class method
[x] password for user from omniauth

[x] add uid to user table


[x] put flash notice into application layout?
-----------------------------------
[] edit page has menu items only one time
[] edit page needs to have items prepopulated and show other options for bentos

[] 3 columns for new bento box

kiele notes
[x] user past orders on menu page in second column
[x] github login
[?????????????????] bread crumbs
[x] order button on menu page
[x] prepopulate order new from bento show
[x] menu in nav bar

[] pair of values connected, so snack is 2, drink is 1, entree is 7

[x] only user associated w bento box can edit/delete it
    [x] user has many bentos
    [x] bento boxes belong to user
    [x] add migration - rails g migration add_user_id_to_bentoboxes user_id:integer
    [x] add user_id info to db - rails db:seed
    [x] check out db in console
    [x] create hidden field??? so association is set up on new bento form

[x] add quantity to bento_menu_items
    [x] add migration - rails g migration add_quantity_to_bento_menu_items quantity:integer + default value
    [x] run migration
    [x] update controller
    [x] form
[x] total price calculation

    
[x] user can't delete bento box

[] add radio button for pickup or delivery to order
    [x] add pickup_deliver to migration - rails g migration add_pickup_deliver_to_orders pickup_deliver:string
    [x] update schema
    [] add dropdown to form

[x] user show page id does weird things

[] 

omniauth user
redirect not working for users show

things to learn about hidden tag

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

layouts/application
<!DOCTYPE html>
<html>
  <head>
    <title>Bento</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
  <h1>Adventure Bento!</h1>
    <%= yield %>
  </body>
</html>

<p>
    <%= f.label :bento_type%>
    <%= f.text_field :bento_type%>
</p>

<p>
    <%= f.label :item_type%>
    <%= f.text_field :item_type%>
    </p>

        <%= button_to "Delete this menu item", menu_item_path(@menu_item), method: :delete %>

<%= f.hidden_field :bento_menu_item_id.menu_item.name%>

        <% if bento_menu_item.quantity != 0 %>

        <%#=#f.collection_check_boxes :menu_item_ids, MenuItem.all, :id, :name do |check_box| %>
           <%#=#check_box.label(class: "check_box") do %>
            <%#=#check_box.check_box(class: "check_box") %>
            <%#=#check_box.object.name %></br>
            <%# end %>
        <%# end %>
