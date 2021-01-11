class ServicesController < ApplicationController
    def new
        @service = Service.new
        @program = ServiceWork.find_by(service_id: @service.id)
    end

    def create 
        @service = Service.new(service_params)
            binding.pry
        if @service.save
            redirect_to service_path(@service)
        else
            render :new
            binding.pry
        end
    end

    def show
        @service = Service.find(params[:id])
        @program = ServiceWork.find_by(service_id: @service.id)
    end

    private 

    def service_params
        params.require(:service).permit(:start_time, :end_time, :concert)
    end
end