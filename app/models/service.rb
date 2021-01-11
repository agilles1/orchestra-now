class Service < ApplicationRecord
    has_many :service_works
    has_many :works, through: :service_works

end
