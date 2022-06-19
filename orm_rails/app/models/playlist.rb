class Playlist < ApplicationRecord
  has_many :users
  has_many :playlists_songs
  has_many :songs, :through => :playlists_songs

  validates :name, presence: true
  validates :number_songs, numericality: { only_integer: true, greater_than: 1 }
end
       