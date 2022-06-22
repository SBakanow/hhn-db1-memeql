require "test_helper"

class ArtistTest < ActiveSupport::TestCase
  test "associations" do
    assert_includes artists(:fankhauser).albums, albums(:wait_for_it_ep)
    assert_includes artists(:ed_sheeran).albums, albums(:divide)
    assert_includes artists(:fankhauser).songs, songs(:planetary)
    assert_includes artists(:fankhauser).users, users(:sergej)
  end

  test "delete artist" do
    assert_equal 3, Artist.count
    AccessPatterns.deleteArtistByLastName("Sheeran")
    assert_equal 2, Artist.count
    assert_nil Artist.find_by("last_name = ?", "Sheeran")
  end
end
