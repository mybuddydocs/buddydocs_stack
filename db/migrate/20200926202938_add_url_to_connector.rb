class AddUrlToConnector < ActiveRecord::Migration[6.0]
  def change
    add_column :connectors, :url, :string
  end
end
