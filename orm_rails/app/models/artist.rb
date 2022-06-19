class Artist < ApplicationRecord
  has_many :songs
  has_many :albums, optional: true
  has_many :subscriptions, optional: true
  has_many :users, :through => :subscriptions, optional: true

  validates :first_name, presence: true
  validates :last_name, presence: true
end
 