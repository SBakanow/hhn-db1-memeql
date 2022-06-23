class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs

  validates :name, presence: true
  validates :released_at, presence: true
  validates :artist, presence: true

  def self.addNewOrExistingSongToAlbum(song, album)
    album.songs << song
  end
  
  def self.updateGenreOfAlbum(album, genre)
    album.genre = genre
    album.save
  end
end
