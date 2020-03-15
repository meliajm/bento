class BentoboxesController < ApplicationController

    def new
        @bento = Bentobox.new
        @menu_items = MenuItem.all
        @bento.menu_items.build()
        @bento.menu_items.build()
        @bento.menu_items.build()
        @bento.menu_items.build()
        @bento.menu_items.build()
        @bento.menu_items.build()
        @bento.menu_items.build()
        # do 7 times
    end

    def create

        @bento = Bentobox.create(bento_params)
        binding.pry
        if @bento.save
            redirect_to bentobox_path(@bento)
        else
            redirect_to new_bentobox_path
        end
    end

    def index
        @bentos = Bentobox.all
        # @menu_items = @bentos.menu_items
    end

    def show
        @bento = Bentobox.find_by(id: params[:id])
    end

    def total_price
        @bento = Bentobox.find_by(id: params[:id])
    end

    private
 
    def bento_params
        params.require(:bentobox).permit(:name, :bento_type, menu_item_ids: [])
    end

end
