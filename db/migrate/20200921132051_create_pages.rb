class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.integer :page_number
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
