class AddGeneratedDateToDocument < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :generated_date, :date
  end
end
