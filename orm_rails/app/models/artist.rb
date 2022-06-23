class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, :through => :subscriptions

  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.findAllSongsOfArtist(last_name)
    self.find_by!(last_name: last_name).songs
  end

  def self.deleteArtistByLastName(last_name)
    self.destroy_by(last_name: last_name)
  end
end
 