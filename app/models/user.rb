class User < ApplicationRecord
    has_many :user_services
    has_many :services, through: :user_services
    has_secrure_password
end
