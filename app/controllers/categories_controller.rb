class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    documents_with_date = Document.select {|document| document.reminder_date != nil }
    @documents_with_reminder = documents_with_date.sort_by {|document| document.reminder_date}

    # ajout document
    @document = Document.new
    #  BUG: content et page_number pas pris en compte dans le build (mettre des inputs caché)
    @document.pages.build(content: 'en cours de traitement', page_number: 1)
    @document.document_tags.build

    # ajout des connecteurs
    @connectors = Connector.all

    # Ajout credential
    @credential = Credential.new
  end
end
