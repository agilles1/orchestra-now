class Composer < ApplicationRecord
    has_many :works
    validates :full_name, presence: true, uniqueness: true
    validates :last_name, presence: true
    scope :by_last_name, -> {order(:last_name)}

    def works_in_alpha
        self.works.order(:title)
    end

end