class User < ApplicationRecord
  has_many :subscriptions
  has_many :artists, :through => :subscriptions
  has_many :playlists
end
