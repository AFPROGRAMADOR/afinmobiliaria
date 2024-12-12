class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
    has_many :properties, dependent: :destroy
    validates :name, presence: false
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 4 }
end 