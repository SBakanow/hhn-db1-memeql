class Subscription < ApplicationRecord
  has_many :users
  has_many :artists
end
