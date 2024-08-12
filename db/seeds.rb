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
u4=User.create(username: "4반", email: "d@d", password: "password", password_confirmation: "password")
u5=User.create(username: "5반", email: "e@e", password: "password", password_confirmation: "password")
u6=User.create(username: "6반", email: "f@f", password: "password", password_confirmation: "password")
u7=User.create(username: "7반", email: "g@g", password: "password", password_confirmation: "password")
u8=User.create(username: "8반", email: "h@h", password: "password", password_confirmation: "password")
u9=User.create(username: "9반", email: "i@i", password: "password", password_confirmation: "password")
u10=User.create(username: "10반", email: "j@j", password: "password", password_confirmation: "password")
u11=User.create(username: "11반", email: "k@k", password: "password", password_confirmation: "password")
u12=User.create(username: "12반", email: "l@l", password: "password", password_confirmation: "password")
u13=User.create(username: "13반", email: "m@m", password: "password", password_confirmation: "password")

u1.add_role(:admin)
u2.add_role(:user)
u3.add_role(:user)
u4.add_role(:user)
u5.add_role(:user)
u6.add_role(:user)
u7.add_role(:user)
u8.add_role(:user)
u9.add_role(:user)
u10.add_role(:user)
u11.add_role(:user)
u12.add_role(:admin)
u13.add_role(:admin)

s0 = Schedule.create(entry_date: Time.strptime("2024-03-01", "%Y-%m-%d").to_time)
s1 = Schedule.create(entry_date: Time.zone.today.monday)
s2 = Schedule.create(entry_date: Time.zone.today.monday+1)
s3 = Schedule.create(entry_date: Time.zone.today.monday+2)
s4 = Schedule.create(entry_date: Time.zone.today.monday+3)
s5 = Schedule.create(entry_date: Time.zone.today.monday+4)

list1 = List.create(name: 'TODO', schedule: s0, period: 0, floor: 0)
list1.items.create(name: "과학1", body: "식물의 한살이", user: u1, color: "ffddd6")
list1.items.create(name: "과학2", body: "용수철 저울", user: u1, color: "daf7a6")
list1.items.create(name: "과학3", body: "혼합물 분리", user: u1, color: "ffc300")

List.create(name: '1교시', schedule: s1, period: 1, floor: 3)
List.create(name: '2교시', schedule: s1, period: 2, floor: 3)
List.create(name: '3교시', schedule: s1, period: 3, floor: 3)
List.create(name: '4교시', schedule: s1, period: 4, floor: 3)
List.create(name: '5교시', schedule: s1, period: 5, floor: 3)
List.create(name: '1교시', schedule: s1, period: 1, floor: 4)
List.create(name: '2교시', schedule: s1, period: 2, floor: 4)
List.create(name: '3교시', schedule: s1, period: 3, floor: 4)
List.create(name: '4교시', schedule: s1, period: 4, floor: 4)
List.create(name: '5교시', schedule: s1, period: 5, floor: 4)

List.create(name: '1교시', schedule: s2, period: 1, floor: 3)
List.create(name: '2교시', schedule: s2, period: 2, floor: 3)
List.create(name: '3교시', schedule: s2, period: 3, floor: 3)
List.create(name: '4교시', schedule: s2, period: 4, floor: 3)
List.create(name: '5교시', schedule: s2, period: 5, floor: 3)
List.create(name: '1교시', schedule: s2, period: 1, floor: 4)
List.create(name: '2교시', schedule: s2, period: 2, floor: 4)
List.create(name: '3교시', schedule: s2, period: 3, floor: 4)
List.create(name: '4교시', schedule: s2, period: 4, floor: 4)
List.create(name: '5교시', schedule: s2, period: 5, floor: 4)

List.create(name: '1교시', schedule: s3, period: 1, floor: 3)
List.create(name: '2교시', schedule: s3, period: 2, floor: 3)
List.create(name: '3교시', schedule: s3, period: 3, floor: 3)
List.create(name: '4교시', schedule: s3, period: 4, floor: 3)
List.create(name: '5교시', schedule: s3, period: 5, floor: 3)
List.create(name: '1교시', schedule: s3, period: 1, floor: 4)
List.create(name: '2교시', schedule: s3, period: 2, floor: 4)
List.create(name: '3교시', schedule: s3, period: 3, floor: 4)
List.create(name: '4교시', schedule: s3, period: 4, floor: 4)
List.create(name: '5교시', schedule: s3, period: 5, floor: 4)

List.create(name: '1교시', schedule: s4, period: 1, floor: 3)
List.create(name: '2교시', schedule: s4, period: 2, floor: 3)
List.create(name: '3교시', schedule: s4, period: 3, floor: 3)
List.create(name: '4교시', schedule: s4, period: 4, floor: 3)
List.create(name: '5교시', schedule: s4, period: 5, floor: 3)
List.create(name: '1교시', schedule: s4, period: 1, floor: 4)
List.create(name: '2교시', schedule: s4, period: 2, floor: 4)
List.create(name: '3교시', schedule: s4, period: 3, floor: 4)
List.create(name: '4교시', schedule: s4, period: 4, floor: 4)
List.create(name: '5교시', schedule: s4, period: 5, floor: 4)

List.create(name: '1교시', schedule: s5, period: 1, floor: 3)
List.create(name: '2교시', schedule: s5, period: 2, floor: 3)
List.create(name: '3교시', schedule: s5, period: 3, floor: 3)
List.create(name: '4교시', schedule: s5, period: 4, floor: 3)
List.create(name: '5교시', schedule: s5, period: 5, floor: 3)
List.create(name: '1교시', schedule: s5, period: 1, floor: 4)
List.create(name: '2교시', schedule: s5, period: 2, floor: 4)
List.create(name: '3교시', schedule: s5, period: 3, floor: 4)
List.create(name: '4교시', schedule: s5, period: 4, floor: 4)
List.create(name: '5교시', schedule: s5, period: 5, floor: 4)
