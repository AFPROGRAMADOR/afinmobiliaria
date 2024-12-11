class User < ApplicationRecord
    has_many :properties, dependent: :destroy
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true

end 