DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS albums;


CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  artist_name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  artist_id INT4 REFERENCES artists(id),
  title VARCHAR(255),
  genre VARCHAR(255)
);
