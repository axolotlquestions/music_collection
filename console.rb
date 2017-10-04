require("pry")
require_relative("models/album")
require_relative("models/artist")

Album.delete_all
Artist.delete_all

artist1 = Artist.new('artist_name' => "Prince")
artist2 = Artist.new('artist_name' => "Public Enemy")

artist1.save()
artist2.save()

album1 = Album.new('title' => "Purple Rain", 'artist_id' => artist1.id, 'genre' => "Funk" )
album2 = Album.new('title' => "Batman", 'artist_id' => artist1.id, 'genre' => "Soundtrack")
album3 = Album.new('title' => "It Takes a Nation of Millions to Hold Us Back", 'artist_id' =>artist2.id, 'genre' => "Rap")

album1.save()
album2.save()
album3.save()

binding.pry
nil
