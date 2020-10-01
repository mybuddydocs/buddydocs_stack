class HomeController < ApplicationController
  layout "fullwidth", except: [:terms, :privacy]
  def index
  end

  def terms
  end

  def privacy
  end
end
