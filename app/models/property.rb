class Property < ApplicationRecord
  belongs_to :user
  has_many :property_categories
  has_many :categories, through: :property_categories
  has_one_attached :image  # Esto establece la relación con ActiveStorage

   # Validaciones para asegurar datos consistentes
   validates :price, presence: true, numericality: true 
   validates :title, :description, :location, :status, presence: true
   validates :price, numericality: { greater_than: 0 }

end
