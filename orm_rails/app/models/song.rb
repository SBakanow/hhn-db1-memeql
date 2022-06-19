class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :album, optional: true
  has_many :playlists_songs
  has_many :playlists, :through => :playlists_songs

  validates :title, presence: true
  validates :duration, numericality: { only_integer: true, greater_than: 1 }
end
