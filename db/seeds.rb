# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


jake = User.create(name: "Jake MacNaughton", email: "jake@jake.com", current_lat:43.519145, current_long:-110.841258, profile_image_url: "blahblahblah")
wassy = User.create(name: "Josh Wasserman", email: "wassy@jake.com", current_lat:40.7047461, current_long:74.01322789999999, profile_image_url: "blahblahblah")
tashawn = User.create(name: "Tashawn Williams", email: "tashawn@jake.com", current_lat:40.705548, current_long:-74.014014, profile_image_url: "blahblahblah")


room1 = Vacancy.create(title: "Fantastic room!!", address: "338 E 13th Street Apt 2D", city: "New York", state: "NY", zipcode: 10003, description: "muahahahamuahahahamuahahahamuahahaha", lat: 40.731134, long: -73.984099, user_id: 2)
room2 = Vacancy.create(title: "Fantastic room!!", address: "44 Sutton St", city: "Brooklyn", state: "NY", zipcode: 11222, description: "muahahahamuahahahamuahahahamuahahaha", lat: 40.724774, long: -73.940318, user_id: 3)
