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

        if @work.save
            redirect_to composer_work_path(@composer, @work)
        else
            render :new
        end
    end

    def edit
        @composer = Composer.find(params[:composer_id])
        @work = Work.find(params[:id])
        
    end

    def update
        @work = Work.find(params[:id])

        if @work.update(work_params)
            redirect_to composer_work_path(@work)
        else
            render :edit
        end
    end

    def show 
        @work = Work.find(params[:id])
    end

    def destroy
        @work = Work.find(params[:id])
        @work.destroy
        redirect_to works_path
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