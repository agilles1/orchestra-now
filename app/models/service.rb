class Service < ApplicationRecord
    has_many :service_works
    has_many :user_services
    has_many :works, through: :service_works
    has_many :users, through: :user_services
    validates :start_time, presence: true
    validates :end_time, presence: true
   
    def program
        self.works.order(:order)
    end

end
