class WorksController < ApplicationController
    
    
    def index
        @composers = Composer.all.by_last_name
    end

    def new

    end

    def create 

    end

    def show 
        @work = Work.find(params[:id])
    end

    def service_works_new
        @works = Work.all
        @program = ServiceWork.new
    end
end