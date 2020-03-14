class BentoboxesController < ApplicationController

    def index
        @bentos = Bentobox.all
    end

end
