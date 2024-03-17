class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: {with: /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/,message: "Enter a valid email address"}
    validates :email, presence: true

    has_many :payments
    has_many :categories

end
