class Connector < ApplicationRecord
  validates :url, presence: true
end

