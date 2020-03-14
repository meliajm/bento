class BentoboxesController < ApplicationController

    def index
        @bentos = Bentobox.all
        # @menu_items = @bentos.menu_items
    end

end
