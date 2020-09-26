class RemoveContentFromDocuments < ActiveRecord::Migration[6.0]
  def change
    remove_column :documents, :content
  end
end
