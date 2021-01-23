class ComposersController < ApplicationController

    def new 
        @composer = Composer.new
    end

    def create 
        @composer = Composer.new(composer_params)
        if @composer.save
            redirect_to works_path
        else
            render :new
        end
    end

    def edit 
        @composer = Composer.find(params[:id])
    end

    def update 
        @composer = Composer.find(params[:id])
        binding.pry
        @composer.update(composer_params)
        redirect_to works_path
    end

    private

    def composer_params
        params.require(:composer).permit(:full_name, :last_name, :birth_year, :death_year, :epoch)
    end
end