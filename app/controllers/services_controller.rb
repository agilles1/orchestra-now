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
        @service = Service.new(service_params)
        service_works = service_works_params[:service_works_attributes]
        binding.pry
        # if @service.save
        #     service_works[:order].each_with_index  do |order, i|
        #         ServiceWork.create(work_id: service_works[:work_id][i], service_id: @service.id, order: order)
        #     end
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
        )
    end

    def service_works_params
        params.require(:service).permit(
            service_works_attributes: [
                order: [],
                work_id: []
            ]
        )
    end
end