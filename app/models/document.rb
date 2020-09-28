class Document < ApplicationRecord
  belongs_to :user
  has_many :team_documents
  has_many :document_tags, dependent: :destroy
  has_many :pages, dependent: :destroy
end
