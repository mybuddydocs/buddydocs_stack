class DocumentsController < ApplicationController
  def index
    @documents = Document.where(user: current_user)
  end

  def show
  end

  def new
    @document= Document.new
        #  BUG: content et page_number pas pris en compte dans le build (mettre des inputs caché)
    @document.pages.build(content: 'en cours de traitement', page_number: 1)
    @document.document_tags.build
  end

  def create
    # ici enregistre a la fois page new et aussi document_tag egalement
    # et ocr ...
    # pb a regler:
                  # message erreur , probleme de render du else
                  # les couleurs... ,
                  # arriver sur categories index ( bug mais du a des probleme d'enregistrer des dates )
                  #  refiler caméra
    @document = Document.new(document_params)

    @document.user = current_user
    @document.url = "pc"
    @document.origin="pc"
    @document.generated_date = Date.today

    if @document.save
      render 'categories/index'
    else
      render 'documents/new'
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
    params.require(:document).permit(:name, pages_attributes: [:id, :photo], document_tags_attributes: [:id, :tag_id])
  end
end
