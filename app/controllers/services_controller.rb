class ServicesController < ApplicationController
    def show
        @service = Service.find(params[:id])
    end
    
    def calendar

    end

    def new
        @service = Service.new
        
    end

    def create
        binding.pry
        @service = Service.new(service_params)
        # 3.times{@service.works.build}
        binding.pry
        # if @service.save
        #     redirect_to service_path(@service)
        # else
        #     render :new
        # end
    end

    def index 
        @services = Service.future.all_chron
    end

    private 

    def service_params
        params.require(:service).permit(
            :date, 
            :start_time, 
            :end_time, 
            :concert, 
            service_works_attributes: [
                order: [],
                work_id: []
            ]
        )
    end
end