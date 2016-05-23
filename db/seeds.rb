# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


isaac = User.create(name: "Isaac", email: "isaac.newton@gmail.com" , password: "12345678", password_confirmation: "12345678")
Message.create(body: "Hi guyz!", user_id: isaac.id)
Message.create(body: "What news?", user_id: isaac.id)

galileo = User.create(name: "Galilei", email: "galilei.galileo@gmail.com" , password: "12345678", password_confirmation: "12345678")
Message.create(body: "Hi, I throw apples from tower", user_id: galileo.id)

Message.create(body: "It's was you?", user_id: isaac.id)
Message.create(body: "I knew it?", user_id: isaac.id)

albert = User.create(name: "Albert", email: "albert.einstein@gmail.com" , password: "12345678", password_confirmation: "12345678")
Message.create(body: "LOL", user_id: albert.id)

Message.create(body: "Sry", user_id: galileo.id)

nicolaus = User.create(name: "Nicolaus", email: "nicolaus.copernicus@gmail.com" , password: "12345678", password_confirmation: "12345678")
Message.create(body: "guys,pls, go to private messages", user_id: nicolaus.id)