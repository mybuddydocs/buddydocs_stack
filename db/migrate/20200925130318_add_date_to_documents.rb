class AddDateToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :date, :string
  end
end
