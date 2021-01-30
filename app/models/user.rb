class User < ApplicationRecord
    has_many :user_services
    has_many :services, through: :user_services
    validates :email, presence: true
    validates :password, presence: true
    validates :email, uniqueness: true
    has_secure_password

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end
    
end
