class Service < ApplicationRecord
    has_many :service_works
    has_many :user_services
    has_many :works, through: :service_works
    has_many :users, through: :user_services
    validates :start_time, presence: true
    validates :end_time, presence: true
    validate :start_time_is_before_end_time
    scope :rehearsals, -> {where(concert: false)}
    scope :all_chron, -> {order(:start_time)}
    scope :future, -> {where("start_time >= ?", DateTime.current-1)}


    
   
    def program
        self.works.order(:order)
    end

    def date
        self.start_time.strftime('%A, %B %d, %Y')
    end


    def start_time_is_before_end_time
        if start_time > end_time 
            errors.add(:start_date, "can't be in after the end time")
        end
    end


end
