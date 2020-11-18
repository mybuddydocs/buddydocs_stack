class Autocompleter
  MODELS_TO_SEARCH = [Document, Page].freeze

  attr_accessor :query
  attr_accessor :user

  def initialize(query)
    @query = query
  end

  def self.call(query, user)
    new(query).call
  end

  def call
    results.map do |result|
      {
        hint: build_hint(result),
        record_type: result.class.name,
        record_id: result.id
      }
    end
  end

  private

  def results
    Elasticsearch::Model.search(search_query,
                                MODELS_TO_SEARCH).records
        raise

  end

  def build_hint(record)
    HintBuilder.call(record)
  end

  def search_query
    {
      "size": 50,
      "query": {
        "function_score": {
          "query": {
            "bool": {
              "must": [multi_match]
            }
          },
        "functions": priorities
        },
      }
    }
  end

  def multi_match
    {
      "multi_match": {
        "query": @query,
        "fields": %w[name url origin content],
        "fuzziness": 'auto'
      }
    }
  end

  def priorities
    [
      {
        "filter": {
          "term": { "_type": 'document' }
        },
        "weight": 5000
      }
    ]
  end
end
