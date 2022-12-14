require "test_helper"

class SongTest < ActiveSupport::TestCase
  test "association" do
    assert_equal songs(:shape_of_you).artist, artists(:ed_sheeran)
    assert_equal songs(:planetary).album, albums(:wait_for_it_ep)
    assert_nil songs(:redlight).album
    assert_includes songs(:legendary).playlists, playlists(:best_songs)
  end

  test "create new song" do
    assert_nil Song.find_by(title: "Weeper (Original Mix)")
    new_song = Song.createNewSong("Weeper (Original Mix)", 407, Date.new(2011,3,7), artists(:fankhauser))
    assert_equal new_song, Song.find_by(title: "Weeper (Original Mix)")
  end

  test "create new song updates song count" do
    assert_equal 5, Song.count
    new_song = Song.createNewSong("Weeper (Original Mix)", 407, Date.new(2011,3,7), artists(:fankhauser))
    assert_equal 6, Song.count
  end

  test "delete song" do
    assert_not_nil songs(:islandary)
    Song.deleteSongByTitle("Islandary")
    assert_nil Song.find_by(title: "Islandary")
  end

  test "delete song updates song count" do
    assert_equal 5, Song.count
    Song.deleteSongByTitle("Islandary")
    assert_equal 4, Song.count
  end

  test "create new song without title" do
    assert_raises do
      Song.createNewSong(407, Date.new(2011,3,7), artists(:fankhauser))
    end
  end

  test "all songs longer than given amount of seconds" do
    Song.song_duration(300).all.each do |song|
      assert song.duration > 300
    end
  end
end
