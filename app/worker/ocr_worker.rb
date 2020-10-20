class OcrWorker < ApplicationJob


  def perform(page_id)
    page = Page.find(page_id)
    puts 'test sidekiq'
  end
end
