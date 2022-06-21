require "test_helper"

class PlaylistTest < ActiveSupport::TestCase
  test "association" do
    assert_equal playlists(:my_playlist).songs, songs(:planetary, :legendary, :shape_of_you)
    assert_equal playlists(:best_songs).songs, songs(:legendary, :islandary)
  end

  test "add new Frankhauser Song to Sergejs playlist" do
    assert_equal 3, Playlist.joins(:user).where("users.name = ?", "Sergej").joins(:songs).count
    AccessPatterns.createNewFrankhauserSong
    AccessPatterns.addNewFrankhauserSongToSergejsPlaylist
    assert_equal 4, Playlist.joins(:user).where("users.name = ?", "Sergej").joins(:songs).count
  end
end
