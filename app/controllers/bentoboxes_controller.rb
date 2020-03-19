class BentoboxesController < ApplicationController

    before_action :set_bento, only: [:show, :edit, :update, :destroy]

    def new
        @bento = current_user.bentoboxes.build()
        @menu_items = MenuItem.all
        # @user = current_user
        # binding.pry
        # @order = Order.create(user_id: @user.id, bentobox_id: @bento.id)
        # 17.times { @bento.menu_items.build() }
    end

    def create
        @bento = Bentobox.new(bento_params)

        if @bento.save
            redirect_to bentobox_path(@bento)
        else
            flash[:error] = @bento.errors.full_messages
            redirect_to new_bentobox_path
        end
    end

    def index
        @bentos = Bentobox.all
        @user = current_user
        @orders = @user.orders
        # @menu_items = @bentos.menu_items
    end

    def show
    end

    def edit
        if current_user.id != @bento.user_id
            redirect_to bentobox_path(@bento)
        end
    end
    
    def update
        @bento.menu_items.clear
        @bento.save
        @bento.update(bento_params)
        if @bento.save
            redirect_to bentobox_path(@bento)
        else
            flash[:error] = @bento.errors.full_messages
            redirect_to edit_bentobox_path
        end
    end

    def total_price
        @bento = Bentobox.find_by(id: params[:id])
    end

    def destroy
        @bento.destroy
        flash[:notice] = "Bento Box Deleted"
        redirect_to bentoboxes_path
    end

    private
 
    def bento_params
        params.require(:bentobox).permit(:name, :bento_type, :user_id, menu_item_ids: [])
    end

    def set_bento
        @bento = Bentobox.find_by(id: params[:id])
    end

end
