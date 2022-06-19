class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlistsongs
  has_many :songs, :through => :playlistsongs

  validates :name, presence: true
  validates :number_songs, numericality: { only_integer: true, greater_than: 1 }
end
       