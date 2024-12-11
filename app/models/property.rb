class Property < ApplicationRecord
  belongs_to :user
  has_many :property_categories
  has_many :categories, through: :property_categories

   # Validaciones para asegurar datos consistentes
   validates :title, :description, :price, :location, :status, presence: true
   validates :price, numericality: { greater_than: 0 }

end
