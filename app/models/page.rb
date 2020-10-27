class Page < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :document
  has_one_attached :photo
  after_commit :ocr_la_page
  before_save :force_index

  validates :page_number, :document, :content, presence: true

  settings do
    mappings dynamic: false do
      indexes :content, type: :text, analyzer: :french
      indexes :document do
        indexes :id
        indexes :name, type: :text, analyzer: :french
        indexes :url, type: :text, analyzer: :french
        indexes :origin, type: :text, analyzer: :french
        indexes :reminder_date, type: :date
        indexes :generated_date, type: :date
      end
    end
  end


  def as_indexed_json(options = {})
    self.as_json(
      options.merge(
        only: [:content, :created_at, :updated_at],
        include: { document: { only: [:id, :name, :url, :origin, :reminder_date, :generated_date] } }
      )
    )
  end

  def self.update_documents(document, options = {})
    options[:index] ||= index_name
    options[:type]  ||= document_type
    options[:wait_for_completion] ||= false

    options[:body] = {
      conflicts: :proceed,
      query: {
        match: {
          'document.id': document.id
        }
      },
      script: {
        lang:   :painless,
        source: "ctx._source.document.name = params.document.name",
        params: { document: { name: document.name } }
      },
    }

    __elasticsearch__.client.update_by_query(options)
  end

  private

  def ocr_la_page
    OcrWorker.set(wait_until: Date.tomorrow.midnight).perform_later(id)
  end

  def force_index
    if changes['document_id']
      attr = :@__changed_model_attributes
      old_changes = __elasticsearch__.instance_variable_get(attr)
      __elasticsearch__.instance_variable_set(attr, old_changes.merge!('document' => true))
    end
  end
end
