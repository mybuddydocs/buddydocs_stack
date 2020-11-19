class DocumentTag < ApplicationRecord
  belongs_to :tag
  belongs_to :document
  validates :document, :tag, presence: true
end
