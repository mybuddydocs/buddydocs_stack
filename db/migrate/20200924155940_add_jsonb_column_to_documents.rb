class AddJsonbColumnToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :content, :jsonb
  end
end
