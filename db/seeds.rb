# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
u1=User.create(username: "1반", email: "a@a", password: "password", password_confirmation: "password")
u2=User.create(username: "2반", email: "b@b", password: "password", password_confirmation: "password")
u3=User.create(username: "3반", email: "c@c", password: "password", password_confirmation: "password")
u1.add_role(:admin)
u2.add_role(:user)
u3.add_role(:user)

list1 = List.create(name: 'TODO')
list1.items.create(name: "과학1", body: "식물의 한살이", user: u1, color: "ffddd6")
list1.items.create(name: "과학2", body: "용수철 저울", user: u1, color: "daf7a6")
list1.items.create(name: "과학3", body: "혼합물 분리", user: u1, color: "ffc300")

for i in 0..4
  List.create(name: '1교시')
  List.create(name: '2교시')
  List.create(name: '3교시')
  List.create(name: '4교시')
  List.create(name: '5교시')
  List.create(name: '1교시')
  List.create(name: '2교시')
  List.create(name: '3교시')
  List.create(name: '4교시')
  List.create(name: '5교시')
end
