class Tag < ApplicationRecord
  belongs_to :category
  has_many :document_tags, dependent: :destroy
end
