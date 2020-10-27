class PagesController < ApplicationController
  def index
    query = params[:search_pages].presence && params[:search_pages][:query]
    user_docs = Page.joins(:document).where(documents: { user: current_user})
    if query && query != ""
      @pages = user_docs.search(query)
    else
      @pages = user_docs
    end
  end

  def show
    @page = Page.find(params[:id])
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
