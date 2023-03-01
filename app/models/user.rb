class User < ApplicationRecord
    has_many :bookings

    has_secure_password
  
    validates :full_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :mobile_number, presence: true, uniqueness: true, length: { minimum: 10 }
    validates :password, presence: true, length: { minimum: 6 }
  end
  