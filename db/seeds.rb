# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

genre = Genre.create!( name: "小説")
genre = Genre.create!( name: "イラスト")
genre = Genre.create!( name: "音楽")
genre = Genre.create!( name: "その他")

Admin.create!( email: "aiueo@aiueo", password: "aaaaaa")
