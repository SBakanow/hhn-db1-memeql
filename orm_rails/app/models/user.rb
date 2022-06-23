class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :artists, :through => :subscriptions
  has_many :playlists, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def self.deleteSubscriptionToArtist(user, artist)
    user.artists.delete(artist)
  end

  def self.updateNameOfUser(user, name)
    user.name = name
    user.save
  end
end
 