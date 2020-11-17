class RenameDocumentsDateToGeneratedDate < ActiveRecord::Migration[6.0]
  def change
    rename_column :documents, :date, :generated_date
  end
end
