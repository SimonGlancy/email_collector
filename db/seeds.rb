# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Email.create("Address":"barney@lostmy.name","EmailType":"Shipment","Event":"send","Timestamp":1432820696)
Email.create("Address":"tom@lostmy.name","EmailType":"UserConfirmation","Event":"click","Timestamp":1432820702)
Email.create("Address":"vitor@lostmy.name","EmailType":"Shipment","Event":"open","Timestamp":1432820704)
