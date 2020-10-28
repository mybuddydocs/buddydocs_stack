class Document < ApplicationRecord
  include Searchable

  belongs_to :user
  has_many :team_documents
  has_many :document_tags, dependent: :destroy, inverse_of: :document
  has_many :tags, through: :document_tags
  has_many :pages, dependent: :destroy, inverse_of: :document
  accepts_nested_attributes_for :pages, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :document_tags, allow_destroy: true, reject_if: :all_blank
  validates :name, :generated_date, :url,:origin, presence: true


  settings index: { number_of_shards: 1 } do
    mappings dynamic: :false do
      indexes :name, type: 'text', analyzer: 'ngram_analyzer',
                     search_analyzer: 'whitespace_analyzer'
      indexes :generated_date
      indexes :url, type: 'text', analyzer: 'ngram_analyzer',
                     search_analyzer: 'whitespace_analyzer'
      indexes :origin, type: 'text', analyzer: 'ngram_analyzer',
                     search_analyzer: 'whitespace_analyzer'
      indexes :user_id, type: 'integer'
    end
  end
end
