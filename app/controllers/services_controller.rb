class ServicesController < ApplicationController
    before_action :set_service, only: [:show, :new, :edit]
    

    def show

    end
    
    def calendar

    end

    def new
        
    end

    def create
     
        @service = Service.new(service_params)
        service_works = service_works_params[:service_works_attributes]

        if @service.save
            service_works[:order].reject(&:empty?).each_with_index  do |order, i|
                ServiceWork.create(work_id: service_works[:work_id][i], service_id: @service.id, order: order)
            end
            redirect_to service_path(@service)
        else
            render :new
        end
    end

    def edit 
           
    end

    def update

        @service = Service.find_by(service_params[:id])
        service_works = service_works_params[:service_works_attributes]

        if @service.update(service_params)
           
            service_works[:order].reject(&:empty?).each_with_index  do |order, i|
        
                if !service_works[:id][i].empty?
                    work = ServiceWork.find(service_works[:id][i])
                    work.order = order
                    work.work_id = service_works[:work_id][i]
                    work.save
                else 
                    ServiceWork.create(work_id: service_works[:work_id][i], service_id: @service.id, order: order)
                end
            end
            redirect_to service_path(@service)
        else
            render :edit
        end
    end

    def index 
        @services = Service.all_chron.future
    end

    def destroy
        @service = Service.find(params[:id])
        @service.service_works.destroy_all
        @service.destroy
        redirect_to '/home'
    end

    private 

    def service_params
        params.require(:service).permit(
            :date, 
            :start_time, 
            :end_time, 
            :concert
        )
    end

   

    def service_works_params
        params.require(:service).permit(
            service_works_attributes: [
                order: [],
                work_id: [],
                id: []
            ]
        )
    end

    def set_service
        if params[:id]
            @service = Service.find(params[:id])
        else
            @service = Service.new 
        end
    end

end