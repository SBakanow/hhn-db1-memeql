require "test_helper"

class AlbumTest < ActiveSupport::TestCase
  test "association" do
    assert_equal albums(:wait_for_it_ep).artist, artists(:fankhauser)
    assert_equal albums(:wait_for_it_ep).songs, songs(:planetary, :islandary, :legendary)
  end

  test "add new or existing song to album" do
    assert_equal 1, albums(:divide).songs.count
    new_song = AccessPatterns.createNewSong("Eraser", 228, Date.new(2017,3,3), artists(:ed_sheeran))
    AccessPatterns.addNewOrExistingSongToAlbum(new_song, albums(:divide))
    assert_equal 2, albums(:divide).reload.songs.count
    assert_equal "Eraser", Song.joins(:album).where("name = ?", "DIVIDE").find(new_song.id).title
  end

  test "delete song updates album song count" do
    assert_equal 3, Album.where("name = ?", "Wait for it EP").joins(:songs).count
    AccessPatterns.deleteSongByTitle("Islandary")
    assert_equal 2, Album.where("name = ?", "Wait for it EP").joins(:songs).count
    assert_nil Song.find_by("title = ?", "Islandary")
  end

  test "update genre of album" do
    assert_equal "Deep House", albums(:wait_for_it_ep).reload.genre
    AccessPatterns.updateGenreOfAlbum(albums(:wait_for_it_ep), "Electronic")
    assert_equal "Electronic", albums(:wait_for_it_ep).reload.genre
  end

  test "test lastnames of artist songs" do
    AccessPatterns.showAllSongsOfArtist("Fankhauser").each do |song|
      assert_equal "Fankhauser", song.artist.last_name
    end
  end

  test "test not existing name artist song" do
    assert_raises do
      AccessPatterns.showAllSongsOfArtist("Not existing lastname")
    end
  end
end
