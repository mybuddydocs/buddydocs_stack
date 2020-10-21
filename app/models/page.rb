class Page < ApplicationRecord
  belongs_to :document
  has_one_attached :photo

  after_commit :ocr_la_page

  private

  def ocr_la_page
    OcrWorker.set(wait_until: Date.tomorrow.midnight).perform_later(id)
  end
end
