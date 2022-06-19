class User < ApplicationRecord
  has_many :subscriptions
  has_many :artists, :through => :subscriptions
  has_many :playlists

  validates :name, presence: true
  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
 