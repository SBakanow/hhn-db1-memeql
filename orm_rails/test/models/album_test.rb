require "test_helper"

class AlbumTest < ActiveSupport::TestCase
  test "association" do
    assert_equal albums(:wait_for_it_ep).artist, artists(:fankhauser)
    assert_equal albums(:wait_for_it_ep).songs, songs(:planetary, :islandary, :legendary)
  end

  test "add new song to album" do
    assert_nil albums(:divide).songs.find_by(title: "Eraser")
    new_song = Song.createNewSong("Eraser", 228, Date.new(2017,3,3), artists(:ed_sheeran))
    Album.addNewOrExistingSongToAlbum(new_song, albums(:divide))
    assert_equal new_song, albums(:divide).reload.songs.find_by(title: "Eraser")
  end

  test "adding new or existing song increases album song count" do
    assert_equal 1, albums(:divide).songs.count
    new_song = Song.createNewSong("Eraser", 228, Date.new(2017,3,3), artists(:ed_sheeran))
    Album.addNewOrExistingSongToAlbum(new_song, albums(:divide))
    assert_equal 2, albums(:divide).reload.songs.count
  end

  test "delete song updates album song count" do
    assert_equal 3, albums(:wait_for_it_ep).songs.count
    Song.deleteSongByTitle("Islandary")
    assert_equal 2, albums(:wait_for_it_ep).reload.songs.count
  end

  test "update genre of album" do
    assert_equal "Deep House", albums(:wait_for_it_ep).genre
    Album.updateGenreOfAlbum(albums(:wait_for_it_ep), "Electronic")
    assert_equal "Electronic", albums(:wait_for_it_ep).reload.genre
  end
end
