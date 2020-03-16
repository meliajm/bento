class BentoboxesController < ApplicationController

    before_action :set_bento, only: [:show, :edit, :update]

    def new
        @bento = Bentobox.new
        @menu_items = MenuItem.all
        # @user = current_user
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
        # @menu_items = @bentos.menu_items
    end

    def show
    end

    def edit
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

    private
 
    def bento_params
        params.require(:bentobox).permit(:name, :bento_type, menu_item_ids: [])
    end

    def set_bento
        @bento = Bentobox.find_by(id: params[:id])
    end

end
