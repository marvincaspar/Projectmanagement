# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create email: "admin@example.com", password: "password"
admin.add_role "admin"
user1 = User.create email: "user1@example.com", password: "password"
user1.add_role "user"
user2 = User.create email: "user2@example.com", password: "password"
user2.add_role "user"

project1 = Project.create name: 'Project #1', user: admin
project2 = Project.create name: 'Project #2', user: user1