class BentoboxesController < ApplicationController

    before_action :set_bento, only: [:show, :edit, :update, :destroy, :total_price]

    def new
        @bento = current_user.bentoboxes.build()
        @menu_items = MenuItem.all
        MenuItem.all.each do |item|
            @bento.bento_menu_items.build(menu_item: item)
        end
    end

    def create
        @bento = Bentobox.new(bento_params)
        validation(new_bentobox_path)
    end

    def index
        # user with id of 4 is like admin
        @bentos = Bentobox.all.select { |bento| bento.user_id == 4}
        @user = current_user
        @orders = @user.orders
    end

    def show
    end

    def edit
        if current_user.id != @bento.user_id
            redirect_to bentobox_path(@bento)
        end
        MenuItem.all.each do |item|
            @bento.bento_menu_items.build(menu_item: item) if !@bento.menu_items.include?(item)
        end
    end
    
    def update
        @bento.menu_items.clear
        @bento.bento_menu_items.clear
        @bento.save
        @bento.update(bento_params)
        validation(edit_bentobox_path)
    end

    def total_price 
    end

    def destroy
        @bento.destroy
        flash[:notice] = "Bento Box Deleted"
        redirect_to bentoboxes_path
    end

    private
 
    def bento_params
        params.require(:bentobox).permit(:name, :bento_type, :user_id, menu_item_ids: [], bento_menu_items_attributes: [:quantity, :menu_item_id])
    end

    def set_bento
        @bento = Bentobox.find_by(id: params[:id])
    end

    def validation(path)
        if @bento.save
            redirect_to bentobox_path(@bento)
        else
            flash[:error] = @bento.errors.full_messages
            redirect_to path
        end
    end

end
