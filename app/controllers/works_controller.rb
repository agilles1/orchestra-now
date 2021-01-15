class WorksController < ApplicationController

    def index
        @composers = Composer.all
    end

    def new

    end

    def create 

    end

    def show 

    end

    def service_works_new
        @works = Work.all
        @program = ServiceWork.new
    end
end