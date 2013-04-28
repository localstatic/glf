# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Place.count == 0
  Place.create(name: "Pad Thai")
  Place.create(name: "Mongolian Grill", url: "http://www.mongoliangrilllayton.com/")
  Place.create(name: "Taste of India", url: "http://www.tasteofindiautah.com/")
  Place.create(name: "Boston's", url: "http://www.bostonsgourmet.com/home/")
  Place.create(name: "Cantina", url: "http://www.cantinasouthwesterngrill.com/")
  Place.create(name: "Vito's", url: "")
  Place.create(name: "Dickey's BBQ", url: "http://www.dickeys.com/")
  Place.create(name: "Mikado", url: "http://www.watkinsrg.com/Mikado_Japanese_Sushi.html")
end
  #Place.create(name: "", url: "")
  #Place.create(name: "", url: "")
  #Place.create(name: "", url: "")
