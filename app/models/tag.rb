class Tag < ApplicationRecord
  belongs_to :category
  has_many :document_tags, dependent: :destroy
  has_many :documents, through: :document_tags
end
