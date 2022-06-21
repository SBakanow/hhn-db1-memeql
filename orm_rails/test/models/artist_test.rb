require "test_helper"

class ArtistTest < ActiveSupport::TestCase
  test "delete Ed Sheeran" do
    assert_equal 2, Artist.count
    AccessPatterns.deleteEdSheeran
    assert_equal 1, Artist.count
  end
end
