class DocumentsController < ApplicationController
  def index
    @documents = Document.where(user: current_user)
  end

  def show
  end

  def new
  end

  def create
    # ici enregistre a la fois page new et aussi document_tag egalement
    # et ocr ...
    # pb a regler: les messages d'erreur,
                  # afficher la photo a upload ,
                  # les couleurs... ,
                  # arriver sur categories index,
                  # relancer la machine etc...
                  # flex space around
                  #  refiler caméra
                  #  date du doc, ocr ou uplaod?
    @document = Document.new(document_params)
    @document.user = current_user
    @document.url = "pc"
    @document.origin="pc"
    @document.generated_date = Date.today

    @document_tag = DocumentTag.new(document_params[:document_tags_attributes])

    @page = Page.new(document_params[:pages_attributes])
    @page.content ='en cours de traitement'
    @page.page_number = 1
    @page.document = @document
    @page.photo.attach(params["document"]["page"]["photo"])
    @page.save!
    #  l'ocr est fait par google dans l'after commit de page
    @document_tag.document = @document
    @document_tag.tag = Tag.find(params["document"]["document_tag"]["tag"])
    @document_tag.save!
    if @document.save!
      redirect_to categories_path
    else
      render 'new'
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def document_params
    params.require(:document).permit(:name, :url, :generated_date, :origin, pages_attributes: [:photo], document_tags_attributes: [:tag] )
  end
end
