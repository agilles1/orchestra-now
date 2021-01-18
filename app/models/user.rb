class User < ApplicationRecord
    has_many :user_services
    has_many :services, through: :user_services
    validates :email, presence: true
    validates :password_confirmation, presence: true
    validates :email, uniqueness: true
    has_secure_password
end
