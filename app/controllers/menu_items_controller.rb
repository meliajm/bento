class MenuItemsController < ApplicationController

    before_action :set_menu_items, only: [:show, :edit, :update, :destroy]

    def index
        @menu_items = MenuItem.all 
        @bento_menu_item = @menu_items.bento_menu_item
    end

    def show
    end
    
    # def new
    #     # if user.admin == 'true'
    #         @menu_item = MenuItem.new
    #     # else
    #         # redirect_to bentoboxes_path
    #     # end
    # end

    # def create
    #     @menu_item = MenuItem.new(menu_items_params)
    #     if @menu_item.save
    #         redirect_to menu_item_path(@menu_item)        
    #     else
    #         redirect_to new_menu_item_path
    #     end
    # end

    # def edit
    # end
    
    # def update
    #     @menu_item.update(menu_items_params)
    #     if @menu_item.save
    #         redirect_to menu_item_path(@menu_item)
    #     else
    #         flash[:error] = @menu_item.errors.full_messages
    #         redirect_to edit_menu_item_path
    #     end
    # end

    # def destroy
    #     @menu_item.destroy 
    #     flash[:notice] = 'Menu item deleted'
    #     redirect_to menu_items_path
    # end

    private
 
    def menu_items_params
        params.require(:menu_item).permit(:name, :item_type, :price)
    end

    def set_menu_items
        @menu_item = MenuItem.find(params[:id])
    end
end
