class Document < ApplicationRecord
  belongs_to :user
  has_many :team_documents
  has_many :document_tags, dependent: :destroy, inverse_of: :document
  has_many :tags, through: :document_tags
  has_many :pages, dependent: :destroy, inverse_of: :document
  accepts_nested_attributes_for :pages, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :document_tags, allow_destroy: true, reject_if: :all_blank
  validates :name, :date, :url,:origin, presence: true

  after_commit :update_relations

  private

  def update_relations
    Page.update_documents(self)
  end

end
