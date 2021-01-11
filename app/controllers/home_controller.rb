class HomeController < ApplicationController
   
    def home
        @services = Service.all
    end

end