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

12. [] index for menu
    add relations to bentos and menu items and seed 
13. [x] veggie options, gluten free
14. [] can have 2 side extra instead of entree
15. [x] snack section - omochi, onigiri
16. [] add validations to models
17. [] add user model back in
18. [] order bento with entree first