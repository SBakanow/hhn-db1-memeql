require "test_helper"

class PlaylistTest < ActiveSupport::TestCase
  test "association" do
    assert_equal playlists(:my_playlist).user, users(:sergej)
    assert_equal playlists(:my_playlist).songs, songs(:planetary, :legendary, :shape_of_you)
    assert_equal playlists(:best_songs).songs, songs(:legendary, :islandary)
  end

  test "add new song to playlist" do
    assert_nil playlists(:my_playlist).songs.find_by(title: "Weeper (Original Mix)")
    new_song = AccessPatterns.createNewSong("Weeper (Original Mix)", 407, Date.new(2011,3,7), artists(:fankhauser))
    AccessPatterns.addNewSongToPlaylist(playlists(:my_playlist), new_song)
    assert_equal new_song, playlists(:my_playlist).reload.songs.find_by(title: "Weeper (Original Mix)")
  end

  test "add new song to playlist updates playlist song count" do
    assert_equal 3, playlists(:my_playlist).songs.count
    new_song = AccessPatterns.createNewSong("Weeper (Original Mix)", 407, Date.new(2011,3,7), artists(:fankhauser))
    AccessPatterns.addNewSongToPlaylist(playlists(:my_playlist), new_song)
    assert_equal 4, playlists(:my_playlist).reload.songs.count
  end
end
