class BentoboxesController < ApplicationController

    def index
        @bentos = Bentobox.all
        # @menu_items = @bentos.menu_items
    end

    def show
        @bento = Bentobox.find_by(id: params[:id])
    end

end
