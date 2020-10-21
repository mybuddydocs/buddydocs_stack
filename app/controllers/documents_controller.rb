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
    @document = Document.new(document_params)
    @document.user = current_user
    @document.url = "pc"
    @document.origin="pc"

    @document_tag = DocumentTag.new(document_params[:document_tags_attributes])
    @document.generated_date = Date.today
    @page = Page.new(document_params[:pages_attributes])
    if @document.save!
      redirect_to categories_path
    else
      render 'new'
    end

    @page.content =' test'
    @page.page_number = 1
    @page.document = @document
    @page.photo.attach(params["document"]["page"]["photo"])
    @page.save!
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
    params.require(:document).permit(:name, :url, :generated_date, :origin, pages_attributes: [:photo], document_tags_attributes: [:tag] )
  end
end
