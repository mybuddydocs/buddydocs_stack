class Connector < ApplicationRecord
  validates :url, :name, presence: true
  has_one_attached :photo
end

