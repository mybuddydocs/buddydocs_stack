class Connector < ApplicationRecord
  validates :url, presence: true
  validates :name, presence: true
  has_one_attached :photo
end

