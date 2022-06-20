class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, :through => :subscriptions

  validates :first_name, presence: true
  validates :last_name, presence: true
end
 