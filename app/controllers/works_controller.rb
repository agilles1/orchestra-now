class WorksController < ApplicationController
    before_action :set_composer, only: [:new, :edit, :create]
    before_action :set_work, only: [:show, :edit, :update, :destroy]
    
    def index
        @composers = Composer.all.by_last_name
    end

    def show 
        
    end

    def new
        @work = @composer.works.build
    end

    def edit
        
    end

    def create 
        @work = Work.new(work_params)
        @work.composer_id = @composer.id

        if @work.save
            redirect_to composer_work_path(@composer, @work)
        else
            render :new
        end
    end

    def update
        if @work.update(work_params)
            redirect_to composer_work_path(@work)
        else
            render :edit
        end
    end

    def destroy
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

    def set_composer
        @composer = Composer.find(params[:composer_id])
    end

    def set_work 
        @work = Work.find(params[:id])
    end
end