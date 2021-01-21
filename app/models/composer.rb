class Composer < ApplicationRecord
    has_many :works
    scope :by_last_name, -> {order(:last_name)}

    def works_in_alpha
        self.works.order(:title)
    end

end