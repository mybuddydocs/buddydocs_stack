class OcrWorker < ApplicationJob


  def perform(page_id)
    page = Page.find(page_id)
    photoUploaded = Cloudinary::Search.expression("public_id:#{page.photo.key}").execute
    puts 'test sidekiq'
  end
end
