class User < ApplicationRecord
  belongs_to :subscription, optional: true
end
