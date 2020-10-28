class PagesController < ApplicationController
  def index

    search_result = Autocompleter.call(params[:query].to_s)

    if search_result.empty?
      user_docs = Page.joins(:document).where(documents: { user: current_user})
      @pages = user_docs
    else
      @pages = []
      search_result.each do |result|
        if result[:record_type] == "Page"
          @pages << result[:hint]
        else
          result.each do |document|
            Page.where(document: document).each do |page|
              @pages << page
            end
          end
        end
        @pages
      end
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
