class Page < ApplicationRecord
  belongs_to :document
  has_one_attached :photo

end
