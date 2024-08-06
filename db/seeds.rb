# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
u1=User.create(username: "ai", email: "a@a", password: "password", password_confirmation: "password")
u2=User.create(username: "be", email: "b@b", password: "password", password_confirmation: "password")

list1 = List.create(name: 'TODO')
list1.items.create(body: "과학1준비물", user: u1, color: "ffddd6")
list1.items.create(body: "과학2준비물", user: u1, color: "daf7a6")
list1.items.create(body: "과학3준비물", user: u1, color: "ffc300")

list2 = List.create(name: 'MON')
list3 = List.create(name: 'TUE')
list4 = List.create(name: 'WED')
list5 = List.create(name: 'THU')
list6 = List.create(name: 'FRI')
