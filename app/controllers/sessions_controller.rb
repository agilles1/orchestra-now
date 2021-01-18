class SessionsController < ApplicationController
    skip_before_action :require_login
    
    def new

    end

    def create 
        session[:user_id]
        redirect_to home_path
    end

    def destroy
        session[:id].destroy
        redirect_to home_path
    end

end
