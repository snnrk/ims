# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1  = User.create(displayname: "test1", email: "test1@example.com" , password: "kirapass" , password_confirmation: "kirapass")
user2  = User.create(displayname: "test2", email: "test2@example.com" , password: "kirapass" , password_confirmation: "kirapass")
user3  = User.create(displayname: "test3", email: "test3@example.com" , password: "kirapass" , password_confirmation: "kirapass")
user4  = User.create(displayname: "test4", email: "test4@example.com" , password: "kirapass" , password_confirmation: "kirapass")
user5  = User.create(displayname: "test5", email: "test5@example.com" , password: "kirapass" , password_confirmation: "kirapass")

issue1 = Issue.create(title: "trouble1", fired_time: Time.zone.parse('2016-01-01 00:00:00'), impact: 'Site',                author: user1)
issue2 = Issue.create(title: "trouble2", fired_time: Time.zone.parse('2016-02-01 00:00:00'), impact: 'Redundancy degraded', author: user1)