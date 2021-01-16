class Composer < ApplicationRecord
    has_many :works

    def works_in_alpha
        self.works.order(:title)
    end

end