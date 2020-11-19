class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    documents_with_date = Document.select {|document| document.reminder_date != nil }
    @documents_with_reminder = documents_with_date.sort_by {|document| document.reminder_date}


    # ajout document
    @document = Document.new
    @page = Page.new
    @document_tag = DocumentTag.new
    @tags = Tag.all

    # ajout des connecteurs
    @connectors = Connector.all

  end
end
