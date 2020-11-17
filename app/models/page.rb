class Page < ApplicationRecord
  include Searchable

  belongs_to :document
  has_one_attached :photo
  after_commit :ocr_la_page

  validates :page_number, :document, :content, presence: true

  settings do
    mappings dynamic: false do
      indexes :content, type: :text
    end
  end

  private

  def ocr_la_page
    OcrWorker.set(wait_until: Date.tomorrow.midnight).perform_later(id)
  end


end
