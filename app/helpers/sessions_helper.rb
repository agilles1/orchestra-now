module SessionsHelper

    def new

    end

    def create 
        session[:user_id]
    end

    def destroy
        session[:id].destroy
        redirect_to '/home'
    end
end
