class DocumentsController < ApplicationController
  def index
    @documents = Document.where(user: current_user)
  end

  def show
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def document_params
    params.require(:document).permit(:)
  end

end
