class User < ApplicationRecord
  has_many :subscriptions, optional: true
  has_many :artists, :through => :subscriptions, optional: true
  has_many :playlists, optional: true

  validates :name, presence: true
  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
 