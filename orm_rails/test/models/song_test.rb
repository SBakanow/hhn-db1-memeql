require "test_helper"

class SongTest < ActiveSupport::TestCase
  test "association" do
    assert_equal songs(:shape_of_you).artist, artists(:ed_sheeran)
    assert_equal songs(:planetary).album, albums(:wait_for_it_ep)
    assert_nil songs(:redlight).album
    assert_includes songs(:legendary).playlists, playlists(:best_songs)
  end

  test "create new Frankhauser song updates song count" do
    assert_equal 5, Song.count
    new_song = AccessPatterns.createNewSong("Weeper (Original Mix)", 407, Date.new(2011,3,7), artists(:frankhauser))
    assert_equal 6, Song.count
    assert_includes "Weeper (Original Mix)", Song.find(new_song.id).title
  end

  test "delete song updates song count" do
    assert_equal 5, Song.count
    AccessPatterns.deleteSongByTitle("Islandary")
    assert_equal 4, Song.count
    assert_nil Song.find_by("title = ?", "Islandary")
  end
end
