class MenuItemsController < ApplicationController

    def index
        @menu_items = MenuItem.all 
        @user = current_user
    end

    def show
        @menu_items = MenuItem.find(params[:id])
        @user = current_user
    end

    def new
        @menu_item = MenuItem.new
    end

    def create
         @menu_item = MenuItem.create(menu_items_params)
         redirect_to menu_item_path(@menu_item)
    end

    def edit
		@menu_item = Menu_item.find(params[:id])
    end
    
    def update
        @menu_item = Attraction.find(params[:id])
        @menu_item.update(menu_items_params)
        redirect_to menu_item_path(@menu_item)
    end

    private
 
    def menu_items_params
        params.require(:menu_item).permit(:name, :item_type, :price)
    end
    
end
