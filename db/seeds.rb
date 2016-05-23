# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


isaac = User.create(name: "Isaac", email: "isaac.newton@gmail.com" , password: "12345678", password_confirmation: "12345678")
Message.create(body: "Hello world", user_id: isaac.id)