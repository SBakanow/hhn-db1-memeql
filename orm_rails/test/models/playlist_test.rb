require "test_helper"

class PlaylistTest < ActiveSupport::TestCase
  test "association" do
    assert_equal playlists(:my_playlist).songs, songs(:planetary, :legendary, :shape_of_you)
    assert_equal playlists(:best_songs).songs, songs(:legendary, :islandary)
  end
end
