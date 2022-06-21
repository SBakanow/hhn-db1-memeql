require "test_helper"

class ArtistTest < ActiveSupport::TestCase
  test "delete artist updates artists count" do
    assert_equal 2, Artist.count
    AccessPatterns.deleteArtistByLastName("Sheeran")
    assert_equal 1, Artist.count
  end
end
