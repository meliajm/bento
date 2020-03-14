class MenuItemsController < ApplicationController

    def index
        @menu_items = MenuItems.all 
    end

end
