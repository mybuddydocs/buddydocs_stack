class RemoveDateFromDocument < ActiveRecord::Migration[6.0]
  def change
    remove_column :documents, :date, :string
  end
end
