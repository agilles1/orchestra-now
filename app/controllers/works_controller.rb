class WorksController < ApplicationController

    def index
        if params[:service_id]
            @works = Service.find(params[:service_id]).program
        else
            @works = Work.all
        end

    end

    def new

    end


end