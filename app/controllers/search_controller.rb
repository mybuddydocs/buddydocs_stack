class SearchController < ApplicationController
  def search
    query = params[:search_pages].presence && params[:search_pages][:query]

    if query
      @pages = Page.search_published(query)
    end
  end
end
