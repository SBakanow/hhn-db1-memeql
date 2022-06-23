require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "association" do
    assert_equal users(:sergej).playlists.first, playlists(:my_playlist)
    assert_equal users(:marvin).playlists.first, playlists(:best_songs)
    assert_includes users(:sergej).artists, artists(:ed_sheeran)
  end

  test "delete subscription to artist updates subscription count" do
    assert_equal 2, users(:sergej).subscriptions.count
    User.deleteSubscriptionToArtist(users(:sergej), artists(:ed_sheeran))
    assert_equal 1, users(:sergej).reload.subscriptions.count
  end

  test "update name of user" do
    assert_equal "Marvin", users(:marvin).name
    User.updateNameOfUser(users(:marvin), "Marvilicous")
    assert_equal "Marvilicous", users(:marvin).reload.name
  end

  test "update name of non existing user" do
    assert_raises do
     User.updateNameOfUser(users(:dan), "Dan")
    end
  end

  test "create user with invalid email" do
    assert_raises do
     User.create!("Dan", "daniel.com")
    end
  end
end
