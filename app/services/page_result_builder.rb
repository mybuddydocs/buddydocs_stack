class PageResultBuilder < ResultBuilderBase
  def autocomplete_hint
    # {
    #   document_id: record.document.id,
    #   page_id: record.id,
    #   name: record.document.name,
    #   url: record.document.url,
    #   origin: record.document.origin,
    #   generated_date: record.document.generated_date,
    #   content: record.content,
    #   page: record.page_number
    # }
    record
  end
end
