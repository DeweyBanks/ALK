# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create(name: "Dewey", email: "deweybanks@gmail.com", password: "Mega1974", password_confirmation: "Mega1974", admin: true)
u2 = User.create(name: "Amy", email: "actinglikeakidco@gmail.com", password: "10students", password_confirmation: "10students", admin: true)
# k1 = Kid.create(name: "Billy Madison", email: 'billay@gmail.com' )
