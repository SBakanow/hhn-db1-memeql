require "test_helper"

class SongTest < ActiveSupport::TestCase
  test "create new Frankhauser song" do
    assert_equal 4, Song.count
    AccessPatterns.createNewFrankhauserSong
    assert_equal 5, Song.count
  end

  test "delete song Islandary" do
    assert_equal 4, Song.count
    AccessPatterns.deleteSongIslandary
    assert_equal 3, Song.count
  end
end
