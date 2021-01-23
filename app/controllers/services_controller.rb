class ServicesController < ApplicationController
    before_action :set_service, only: [:show, :new, :edit, :update]
    before_action :set_service_works, only: [:create, :update]
    

    def show

    end
    
    def calendar

    end

    def new

    end

    def create
        @service = Service.new(service_params)
        
        if @service.save
            create_or_update_service_works(@service_works)
            redirect_to service_path(@service)
        else
            render :new
        end
    end

    def duplicate
        @service = Service.find(params[:id])
        @dup_service = @service.dup
        
        if @dup_service.save 
            duplicate_service_works(@service, @dup_service.id)
            redirect_to edit_service_path(@dup_service)
        else 
            flash[:error] = "Service not copied! Please try again."
            redirect_to service_path(@service)
        end
    end

    def edit 
           
    end

    def update
        if !@service.update(service_params) #if a service does not update render :edit form
            render :edit
        else
            create_or_update_service_works(@service_works)
            redirect_to service_path(@service)
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
        if params[:id] && !Service.exists?(params[:id])
            redirect_to '/home'
        elsif params[:id]
            @service = Service.find(params[:id])
        else
            @service = Service.new 
        end
    end

    def set_service_works
        @service_works = service_works_params[:service_works_attributes]
    end

    def duplicate_service_works(service, dup_service_id)
        if service.service_works
            service.service_works.each do |service_work|
                dup_service_work = service_work.dup
                dup_service_work.service_id = dup_service_id
                dup_service_work.save
            end
        end
    end

    def create_or_update_service_works(service_works)
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
    end

end
