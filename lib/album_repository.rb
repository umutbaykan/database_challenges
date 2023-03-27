require_relative 'album.rb'
require_relative 'database_connection'

class AlbumRepository

  def all
    output = []
    sql_statment = 'SELECT * FROM albums'
    results = DatabaseConnection.exec_params(sql_statment, [])
    results.each do |data|
      album = Album.new
      album.id = data['id']
      album.title = data['title']
      album.release_year = data['release_year']
      album.artist_id = data['artist_id']
      output << album
    end
    return output
  end
end
