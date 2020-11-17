class PageResultBuilder < ResultBuilderBase
  def autocomplete_hint
    document = record.document
    {
      document_id: document.id,
      name: document.name,
      url: document.url,
      origin: document.origin,
      generated_date: document.generated_date,
      pages: Page.where(document: document)
    }
  end
end
