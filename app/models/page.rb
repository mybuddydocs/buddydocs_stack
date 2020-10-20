require 'elasticsearch/model'

class Page < ApplicationRecord
  belongs_to :document
  has_one_attached :photo

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  after_commit :ocr_la_page

  private

  def ocr_la_page
    OcrWorker.set(wait_until: Date.tomorrow.midnight).perform_later(id)
  end
end
Page.import
