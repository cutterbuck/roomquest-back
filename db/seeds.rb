# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


jake = User.create(name: "Jake MacNaughton", email: "jake@jake.com", phone: "9145829702", profile_image_url: "blahblahblah")
wassy = User.create(name: "Josh Wasserman", email: "wassy@jake.com", phone: "1234567890", profile_image_url: "blahblahblah")
tashawn = User.create(name: "Tashawn Williams", email: "tashawn@jake.com", phone: "0987654321", profile_image_url: "blahblahblah")
guy = User.create(name: "Guy McGuyver", email: "guy@jake.com", phone: "8889993333", profile_image_url: "blahblahblah")

room1 = Vacancy.create(address: "338 E 13th Street", apt_num: "2D", city: "New York", state: "NY", zipcode: 10003, description: "muahahahamuahahahamuahahahamuahahaha", lat: 40.731134, long: -73.984099, user_id: 2)
room2 = Vacancy.create(address: "44 Sutton St", apt_num: "second floor", city: "Brooklyn", state: "NY", zipcode: 11222, description: "muahahahamuahahahamuahahahamuahahaha", lat: 40.724774, long: -73.940318, user_id: 3)

wassy.vacancy = room1
tashawn.vacancy = room2

jake.friends << wassy
jake.friends << tashawn

wassy.friends << jake
wassy.friends << tashawn
tashawn.friends << jake
tashawn.friends << wassy

wassy.friends << guy
