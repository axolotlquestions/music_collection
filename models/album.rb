require_relative '../db/sql_runner'

class Album

  attr_accessor :title, :artist_id, :genre
  attr_reader :id

  def initialize(details)
      @id = details['id'].to_i if details['id']
      @title = details['title']
      @artist_id = details['artist_id'].to_i()
      @genre = details['genre']
  end

  def save()
    sql = "INSERT INTO albums (
      title, artist_id, genre
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id;
    "
    values = [@title, @artist_id, @genre]
    result = SqlRunner.run(sql, "save_album", values)
    @id = result[0]["id"].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    values = []
    SqlRunner.run(sql, "delete_all_albums", values)
  end

  def self.all()
    sql = "SELECT * FROM albums"
    values = []
    albums = SqlRunner.run(sql, "all", values)
    return albums.map { |album| Album.new(album) }
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [@artist_id]
    results = SqlRunner.run(sql, "get_artist", values)
    artist = results[0]
    return Artist.new(artist)
  end

end
