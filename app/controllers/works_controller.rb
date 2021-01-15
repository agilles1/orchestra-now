class WorksController < ApplicationController

    def index
        @composers = Composer.all
    end

    def new

    end


end