class CreateConnectors < ActiveRecord::Migration[6.0]
  def change
    create_table :connectors do |t|
      t.string :url

      t.timestamps
    end
  end
end
