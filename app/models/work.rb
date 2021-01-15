class Work < ApplicationRecord
    belongs_to :composer
    has_many :service_works
    has_many :services, through: :service_works
    scope :all_alpha, -> {order(:title)}

    def title_with_composer
        self.title + " - " + self.composer.full_name
    end
end
