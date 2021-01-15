class Service < ApplicationRecord
    has_many :service_works
    has_many :user_services
    has_many :works, through: :service_works
    has_many :users, through: :user_services
    validates :start_time, presence: true
    validates :end_time, presence: true
    scope :rehearsals, -> {where(concert: false)}
    scope :all_chron, -> {order(:start_time)}
    scope :future, -> {where("start_time > '#{DateTime.current}'")}
    accepts_nested_attributes_for :service_works

    
   
    def program
        self.works.order(:order)
    end

    def date
        self.start_time.strftime('%A, %B %d, %Y')
    end


end
