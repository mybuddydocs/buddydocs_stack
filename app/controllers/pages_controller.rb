class PagesController < ApplicationController
  def index
    search_result = Autocompleter.call(params[:query].to_s, current_user)
    render json: search_result, status: :found
  end

  def show
    @page = Page.find(params["query"])
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
