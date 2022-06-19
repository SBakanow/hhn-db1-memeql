class Artist < ApplicationRecord
  has_many :songs
  has_many :albums
  has_many :subscriptions
end
