class Artist < ApplicationRecord
  has_many :songs
  has_many :albums
  has_many :subscriptions
  has_many :users, :through => :subscriptions
end
