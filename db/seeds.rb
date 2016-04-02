# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User = User.create(email: "chris.edhogben@gmail.com", password: "12345678")
User.add_role :admin
User.create(email: "chris@chris.com", password: "12345678")
User.create(email: "dance-o-tron@gmail.com", password: "12345678")