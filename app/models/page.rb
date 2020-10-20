require 'elasticsearch/model'

class Page < ApplicationRecord
  belongs_to :document
  has_one_attached :photo
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
Page.import
