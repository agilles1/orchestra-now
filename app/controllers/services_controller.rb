class ServicesController < ApplicationController
    def new
        @service = Service.new
        @program = ServiceWork.find_by(service_id: @service.id)
    end

    def create 
        binding.pry
        @service = Service.new(service_params)
        if @service.save
            redirect_to services_path(@service)
        end
    end

    def show
        @service = Service.find()
        @program = ServiceWork.find_by(service_id: @service.id)
    end

    private 

    def service_params
        params.require(:service).permit(:start_time, :end_time, :concert)
    end
end