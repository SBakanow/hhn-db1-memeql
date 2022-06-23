class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_songs, dependent: :destroy
  has_many :songs, :through => :playlist_songs
  
  validates :name, presence: true
  validates :user, presence: true
  validates :songs, presence: true

  def self.addNewSongToPlaylist(playlist, song)
    playlist.songs << song
  end

  scope :playlist_size, ->(name, size) {Playlist.find_by(name: name).songs.count >= size}
end
       