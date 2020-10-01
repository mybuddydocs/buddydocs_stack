class Connector < ApplicationRecord
  has_many :credentials
  # has_one_attached :photo
  validates :name, :url, presence: true



end

