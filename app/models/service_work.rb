class ServiceWork < ApplicationRecord
    belongs_to :service
    belongs_to :work
    validates :order, presence: true
    validate :order_is_less_than_three
    
    def order_is_less_than_three
        if order > 3 || order < 1
            errors.add(:order, "must be between 1 & 3.")
        end
    end

end
