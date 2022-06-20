class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_songs
  has_many :songs, :through => :playlist_songs
  
  validates :name, presence: true
  validates :number_songs, numericality: { only_integer: true, greater_than: 1 }
end
       