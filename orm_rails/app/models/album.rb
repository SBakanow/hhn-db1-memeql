class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs

  validates :name, presence: true
  validates :released_at, presence: true
  validates :artist, presence: true
end
