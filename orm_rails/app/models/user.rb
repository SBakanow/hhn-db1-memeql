class User < ApplicationRecord
  belongs_to :subscription
  belongs_to :playlist
end
