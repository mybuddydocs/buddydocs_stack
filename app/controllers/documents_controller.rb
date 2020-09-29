class DocumentsController < ApplicationController
  def index
    @documents = Document.where(user: current_user)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
