class User < ApplicationRecord
  belongs_to :subscription
  has_many :playlists
end
