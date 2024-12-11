# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Crear categorías iniciales
categories = ["Casa", "Apartamento", "Local Comercial", "Terreno"]
categories.each { |name| Category.create(name: name) }

# Crear un usuario y propiedades de prueba
user = User.create(name: "Albert", email: "albert@example.com", password: "password123")

# Crear propiedades de ejemplo
Property.create(
  title: "Hermosa casa en la playa",
  description: "Una casa ideal para descansar frente al mar.",
  price: 200000.0,
  location: "Punta Cana",
  status: "Disponible",
  user: user
)
