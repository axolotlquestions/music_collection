require_relative '../db/sql_runner'

class Artist

  attr_accessor :artist_name
  attr_reader :id

  def initialize(details)
      @id = details['id'].to_i if details['id']
      @artist_name = details['artist_name']
  end

  def save()
    sql = "INSERT INTO artists (
      artist_name
    )
    VALUES
    (
      $1
    )
    RETURNING id;
    "
    values = [@artist_name]
    result = SqlRunner.run(sql, "save_artist", values)
    @id = result[0]["id"].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    values = []
    SqlRunner.run(sql, "delete_all_artists", values)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    values = []
    artists = SqlRunner.run(sql, "all", values)
    return artists.map { |artist| Artist.new(artist) }
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1;"
    values = [@id]
    albums = SqlRunner.run(sql, "get_albums", values)
    return albums.map { |album| Album.new(album) }
  end


end
