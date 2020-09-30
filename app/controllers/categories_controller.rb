class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    documents_with_date = Document.select {|document| document.reminder_date != nil }
    @documents_with_reminder = documents_with_date.sort_by {|document| document.reminder_date}
  end
end
