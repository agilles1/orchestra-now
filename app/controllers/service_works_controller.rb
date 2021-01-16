class ServiceWorksController < ApplicationController

    def destroy
        @service_work = ServiceWork.find_by(service_id: params[:service_id], work_id: params[:id])
        @service_work.destroy
        redirect_to service_path(params[:service_id])
    end

end