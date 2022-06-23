class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :album, optional: true
  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, :through => :playlist_songs

  validates :title, presence: true
  validates :duration, presence: true
  validates :released_at, presence: true
  validates :artist, presence: true
  validates :duration, numericality: { only_integer: true, greater_than: 1 }

  def self.createNewSong(title, duration, released_at, artist)
    self.create!(title: title, duration: duration, released_at: released_at, artist: artist)
  end

  def self.deleteSongByTitle(songtitle)
    self.destroy_by("title = ?", songtitle)
  end

  scope :song_duration, ->(duration) { where("duration > ?", duration) }
end
