# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Seed image bookmarks..."

User.create! email: "ed@example.com", password: "ohshit34"

Post.create 	img_url: "http://2.design-milk.com/images/2012/08/Kumi-Yamashita-2a-City-View.jpg" ,
				quoted_from: "2.design-milk.com/"

Post.create 	img_url: "http://www.philashcroft.com/img/medium_img/PA_Oligarch-122x92cm_09_m.jpg" ,
				quoted_from: "www.philashcroft.com"

Post.create 	img_url: "http://deadfix.com/wp-content/uploads/2012/05/Deconstructed-Head-Illustrations-by-Smithe.jpg" ,
				quoted_from: "deadfix.com"

Post.create 	img_url: "http://payload174.cargocollective.com/1/0/128/5787050/AVIATION-VECTORS---JOEL-JAMES-DEVLIN-IIIIII_905.jpg",
				quoted_from: "payload174.cargocollective.com"

Post.create 	img_url: "http://payload168.cargocollective.com/1/0/128/5676992/40days-5_905.jpg",
				quoted_from: "payload168.cargocollective.com"

Post.create 	img_url: "http://pinktentacle.com/images/10/expo_6.jpg",
				quoted_from: "pinktentacle.com"

Post.update_all user_id: User.first.id

puts "Done seeding."