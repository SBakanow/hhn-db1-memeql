require "test_helper"

class AlbumTest < ActiveSupport::TestCase
  test "association" do
    assert_includes artists(:frankhauser).albums, albums(:wait_for_it_ep)
    assert_includes artists(:ed_sheeran).albums, albums(:divide)
  end
end
