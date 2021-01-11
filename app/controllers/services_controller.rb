class ServicesController < ApplicationController
    def show
        @service = Service.find(params[:id])
    end
    
    def calendar

    end

    def new
        @service = Service.new
        @program = ServiceWork.find_by(service_id: @service.id)
    end

    def create 
        @service = Service.new(service_params)
        if @service.save
            redirect_to service_path(@service)
        else
            render :new
        end
    end

    def index 
        @services = Service.future.all_chron
    end

    private 

    def service_params
        params.require(:service).permit(:date, :start_time, :end_time, :concert)
    end
end