class Page < ApplicationRecord
  belongs_to :document
  has_many_attached :photos
end
