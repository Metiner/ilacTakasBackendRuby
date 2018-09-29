require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Grup.create(id: 1, ad: 'AnkaFarma')
user1 = User.create email: '1@1.com', password: '111111', password_confirmation: '111111'
user2 = User.create email: '2@2.com', password: '222222', password_confirmation: '222222'
user1.eczane = Eczane.create ad: '1', gln_no: 'asdasd', grup_id: 1
user2.eczane = Eczane.create ad: '2', gln_no: 'asdasdd', grup_id: 1

