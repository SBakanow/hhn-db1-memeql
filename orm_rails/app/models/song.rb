class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :album, optional: true
  has_many :playlists, optional: true

  validates :title, presence: true
  validates :duration, numericality: { only_integer: true, greater_than: 1 }
end
