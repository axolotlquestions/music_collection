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


end
