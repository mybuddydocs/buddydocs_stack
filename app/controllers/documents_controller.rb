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
    @document = Document.new(document_params)
    @document.user = current_user
    @document.url = "pc"
    @document.origin="pc"

    @document_tag = DocumentTag.new(document_params[:document_tags_attributes])
    @document.date = 'date'
    @page = Page.new(document_params[:pages_attributes])
    if @document.save!
      redirect_to categories_path
    else
      render 'new'
    end

    @page.content ='en cours de traitement'
    @page.page_number = 1
    @page.document = @document
    @page.photo.attach(params["document"]["page"]["photo"])
    @page.save!
    # Utilisation de l'ocr de Cloudinary pour l'ocr
    # Il doit avoir une configuration de l'uplaod ( avec un initialiser ) pour pouvoir des l'upload utiliser l'ocr et pas avoir comme ici à update
    # sleep(3)
    # photoUploaded = Cloudinary::Search.expression("public_id:#{@page.photo.key}").execute
    # result =  Cloudinary::Api.update("#{@page.photo.key}", :ocr => "adv_ocr")
    # @page.content = result
    # @page.save!

    # Utilisition de Google

    @document_tag.document = @document
    @document_tag.tag = Tag.find(params["document"]["document_tag"]["tag"])
    @document_tag.save!
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def document_params
    params.require(:document).permit(:name, pages_attributes: [:photo], document_tags_attributes: [:tag])
  end
end
