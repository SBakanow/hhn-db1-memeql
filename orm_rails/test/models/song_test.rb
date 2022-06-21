require "test_helper"

class SongTest < ActiveSupport::TestCase
  test "create new Frankhauser song updates song count" do
    assert_equal 4, Song.count
    AccessPatterns.createNewSong("Weeper (Original Mix)", 407, Date.new(2011,3,7), artists(:frankhauser))
    assert_equal 5, Song.count
  end

  test "delete song updates song count" do
    assert_equal 4, Song.count
    AccessPatterns.deleteSongByTitle("Islandary")
    assert_equal 3, Song.count
  end
end
