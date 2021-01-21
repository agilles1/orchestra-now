class WorksController < ApplicationController
    
    
    def index
        @composers = Composer.all.by_last_name
    end

    def new
        @composer = Composer.find(params[:composer_id])
        @work = @composer.works.build
    end

    def create 
        @composer = Composer.find(params[:composer_id])
        @work = Work.new(work_params)
        @work.composer_id = @composer.id
        binding.pry
        if @work.save
            redirect_to composer_work_path(@composer, @work)
        else
            render :new
        end
    end

    def show 
        @work = Work.find(params[:id])
    end

    def service_works_new
        @works = Work.all
        @program = ServiceWork.new
    end

    private 

    def work_params
        params.require(:work).permit(:title, :instrumentation)
    end
end