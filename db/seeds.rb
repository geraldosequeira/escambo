# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "################################################"
p "Cadastrando Categorias..."
categories = [
  "Animais e acessórios",
  "Esportes",
  "Para a sua casa",
  "Eletrônicos e celulares",
  "Música e hobbies",
  "Bebês e crianças",
  "Moda e beleza",
  "Veículos e barcos",
  "Imóveis",
  "Empregos e negócios"
]

categories.each do |description|
  Category.find_or_create_by( description: description )
end
p "...[OK!]"

p "################################################"
p "Cadastrando Administrador padrão"
Admin.create!(
           email: "gcm.sequeira@gmail.com",
           name: "Geraldo Sequeira",
           password: "teste123",
           password_confirmation: "teste123"
            )
p "...[OK!]"
p "################################################"
