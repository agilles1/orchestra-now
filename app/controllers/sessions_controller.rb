class SessionsController < ApplicationController
    skip_before_action :require_login
    
    def new
       redirect_to home_path unless !logged_in?
    end

    def create 
        @user = User.find_by(email: params[:email])

        if @user && @user.valid? && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to home_path
        else
            flash[:error] = "Incorrect Email or Password"
            render :new
        end
    end

    def destroy
        session.delete :user_id
        redirect_to login_path
    end

    def omniauth
        @user = User.from_omniauth(auth)
        @user.save
        session[:user_id] = @user.id
        redirect_to home_path
    end

private
    def auth
        request.env['omniauth.auth']
    end
    
end
