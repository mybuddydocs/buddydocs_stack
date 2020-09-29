class AddOriginToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :origin, :string
  end
end
