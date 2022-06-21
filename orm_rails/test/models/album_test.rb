require "test_helper"

class AlbumTest < ActiveSupport::TestCase
  test "association" do
    assert_equal albums(:wait_for_it_ep).artist, artists(:frankhauser)
    assert_equal albums(:wait_for_it_ep).songs, songs(:planetary, :islandary, :legendary)
  end

  test "add new or existing song to album" do
    assert_equal 1, Album.where("name = ?", "DIVIDE").joins(:songs).count
    new_song = AccessPatterns.createNewSong("Eraser", 228, Date.new(2017,3,3), artists(:ed_sheeran))
    AccessPatterns.addNewOrExistingSongToAlbum(new_song, albums(:divide))
    assert_equal 2, Album.where("name = ?", "DIVIDE").joins(:songs).count
    assert_equal "Eraser", Song.joins(:album).where("name = ?", "DIVIDE").find(new_song.id).title
  end

  test "delete song updates album song count" do
    assert_equal 3, Album.where("name = ?", "Wait for it EP").joins(:songs).count
    AccessPatterns.deleteSongByTitle("Islandary")
    assert_equal 2, Album.where("name = ?", "Wait for it EP").joins(:songs).count
    assert_nil Song.find_by("title = ?", "Islandary")
  end

  test "update genre of album" do
    assert_equal "Deep House", Album.where("name = ?", "Wait for it EP").limit(1).pluck(:genre).first
    AccessPatterns.updateGenreOfAlbum(albums(:wait_for_it_ep), "Electronic")
    assert_equal "Electronic", Album.where("name = ?", "Wait for it EP").limit(1).pluck(:genre).first
  end
end
