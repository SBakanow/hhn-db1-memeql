require "test_helper"

class ArtistTest < ActiveSupport::TestCase
  test "associations" do
    assert_includes artists(:frankhauser).albums, albums(:wait_for_it_ep)
    assert_includes artists(:ed_sheeran).albums, albums(:divide)
    assert_includes artists(:frankhauser).songs, songs(:planetary)
    assert_includes artists(:frankhauser).users, users(:sergej)
  end

  test "delete artist updates artists count" do
    assert_equal 3, Artist.count
    AccessPatterns.deleteArtistByLastName("Sheeran")
    assert_equal 2, Artist.count
  end
end
