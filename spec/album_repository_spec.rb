require 'album_repository'


describe AlbumRepository do

  def reset_artists_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_artists_table
  end

  it "tests if all albums are grabbed" do      
    repo = AlbumRepository.new
    albums = repo.all 
    expect(albums.length).to eq 3
    expect(albums.first.id).to eq "1"
    expect(albums.first.title).to eq "Albumiser 2000"
    expect(albums.first.release_year).to eq "2022"
  end
end