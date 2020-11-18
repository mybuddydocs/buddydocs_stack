class DocumentResultBuilder < ResultBuilderBase
  def autocomplete_hint
    {
      document_id: record.id,
      user: record.user.id,
      name: record.name,
      url: record.url,
      origin: record.origin,
      generated_date: record.generated_date,
      pages: Page.where(document: record)
    }
  end

end
