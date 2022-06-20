class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :artists, :through => :subscriptions
  has_many :playlists, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
 