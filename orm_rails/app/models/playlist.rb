class Playlist < ApplicationRecord
  has_many :users
  has_many :songs

  validates :name, presence: true
  validates :number_songs, numericality: { only_integer: true, greater_than: 0 }
end
