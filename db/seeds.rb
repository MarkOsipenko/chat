# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


isaac = User.new(name: "Isaac", email: "isaac.newton@gmail.com" , password: "12345678", password_confirmation: "12345678")

  File.open(Rails.root.join("spec", "support", "avatars", "isaac.jpg"), "r") do |avatar|
    isaac.avatar = avatar
    isaac.save
  end

  room = Room.create(name: "Geeks", owner_id: isaac.id )
  room.users << isaac

  Message.create(body: "Hi guyz!", user_id: isaac.id, room_id: room.id)
  Message.create(body: "What news?", user_id: isaac.id, room_id: room.id)

galileo = User.create(name: "Galilei", email: "galilei.galileo@gmail.com" , password: "12345678", password_confirmation: "12345678")

  File.open(Rails.root.join("spec", "support", "avatars", "galileo.jpg"), "r") do |avatar|
    galileo.avatar = avatar
    galileo.save
  end

  room.users << galileo

  Message.create(body: "Hi, I throw apples from tower", user_id: galileo.id, room_id: room.id)
  Message.create(body: "It's was you?", user_id: isaac.id, room_id: room.id)
  Message.create(body: "I knew it!", user_id: isaac.id, room_id: room.id)

albert = User.create(name: "Albert", email: "albert.einstein@gmail.com" , password: "12345678", password_confirmation: "12345678")

  File.open(Rails.root.join("spec", "support", "avatars", "albert.jpg"), "r") do |avatar|
    albert.avatar = avatar
    albert.save
  end

  room.users << albert
  Message.create(body: "LOL", user_id: albert.id, room_id: room.id)
  Message.create(body: "Sry", user_id: galileo.id, room_id: room.id)

nicolaus = User.create(name: "Nicolaus", email: "nicolaus.copernicus@gmail.com", password: "12345678", password_confirmation: "12345678")
  File.open(Rails.root.join("spec", "support", "avatars", "nicolaus.jpg"), "r") do |avatar|
    nicolaus.avatar = avatar
    nicolaus.save
  end

  room.users << nicolaus
  Message.create(body: "guys,pls, go to private messages", user_id: nicolaus.id, room_id: room.id)

  room1 = Room.create(name: "We will rock you", owner_id: nicolaus.id )
  room1.users << nicolaus

  Message.create(body: "this just my room", user_id: nicolaus.id, room_id: room1.id)

