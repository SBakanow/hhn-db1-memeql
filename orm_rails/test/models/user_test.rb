require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "association" do
    assert_equal users(:sergej).playlists.first, playlists(:my_playlist)
    assert_equal users(:marvin).playlists.first, playlists(:best_songs)
  end

  test "delete Sergejs subscription to Ed Sheeran" do
    assert_equal 2, users(:sergej).subscriptions.count
    AccessPatterns.deleteSergejsSubscriptionToEdSheeran
    assert_equal 1, users(:sergej).subscriptions.count
  end

  test "update name of user Marvin" do
    assert_equal "Marvin", users(:marvin).name
    marvin = User.find_by("name = ?", "Marvin")
    marvin.name = "Marvilicous"
    marvin.save
    assert_equal "Marvilicous", User.find(users(:marvin).id).name
  end
end
