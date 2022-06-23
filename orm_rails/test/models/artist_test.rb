require "test_helper"

class ArtistTest < ActiveSupport::TestCase
  test "associations" do
    assert_includes artists(:fankhauser).albums, albums(:wait_for_it_ep)
    assert_includes artists(:ed_sheeran).albums, albums(:divide)
    assert_includes artists(:fankhauser).songs, songs(:planetary)
    assert_includes artists(:fankhauser).users, users(:sergej)
  end

  test "delete artist updates artist count" do
    assert_equal 3, Artist.count
    Artist.deleteArtistByLastName("Sheeran")
    assert_equal 2, Artist.count
  end

  test "delete artist" do
    assert_not_nil artists(:ed_sheeran) 
    Artist.deleteArtistByLastName("Sheeran")
    assert_nil Artist.find_by(last_name: "Sheeran")
  end

  test "test lastnames of artist songs" do
   Artist.findAllSongsOfArtist("Fankhauser").each do |song|
      assert_equal "Fankhauser", song.artist.last_name
    end
  end

  test "test not existing artist name" do
    assert_raises do
      Artist.showAllSongsOfArtist("Not existing lastname")
    end
  end
end
