class Artist < ApplicationRecord
  belongs_to :song
  belongs_to :album
  beliogs_to :subscription
end
