require "elasticsearch/model"
module Searchable

  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model

    #The after_commit parts says that with every creation, updates or deletions to the model, it will index or delete the associated document in Elasticsearch.
    after_commit :index_document, if: :persisted?
    after_commit on: [:destroy] do
      __elasticsearch__.delete_document
    end
  end

  private

  def index_document
    __elasticsearch__.index_document
  end
end
