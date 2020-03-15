class MenuItemsController < ApplicationController

    def index
        @menu_items = MenuItem.all 
        # @user = current_user
    end

    def show
        @menu_item = MenuItem.find(params[:id])
        # @user = current_user
    end

    def new
        @menu_item = MenuItem.new
    end

    def create
        @menu_item = MenuItem.new(menu_items_params)
        #  redirect_to menu_item_path(@menu_item)
        if @menu_item.save
            redirect_to menu_item_path(@menu_item)        
        else
            redirect_to new_menu_item_path
        end
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
        params.require(:menu_item).permit(:name, :item_type, :price, :bento_name)
    end
    
end
