class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :album
  has_many :playlists

  validates :title, presence: true
  validates :duration, numericality: { only_integer: true, greater_than: 1 }
end
