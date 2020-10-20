class SearchController < ApplicationController
  def search
   if params[:q].nil?
    @posts = []
   else
    @posts = Page.search params[:q]
   end
  end
end
