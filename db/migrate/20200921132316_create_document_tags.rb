class CreateDocumentTags < ActiveRecord::Migration[6.0]
  def change
    create_table :document_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
