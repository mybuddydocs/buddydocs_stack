class DocumentResultBuilder < ResultBuilderBase
  def autocomplete_hint
    # {
    #   document_id: record.id,
    #   name: record.name,
    #   url: record.url,
    #   origin: record.origin,
    #   generated_date: record.generated_date,
    #   pages: Page.where(document: record)
    # }
    record
  end
end
