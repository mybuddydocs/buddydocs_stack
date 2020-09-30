class RemoveUrlFromConnectors < ActiveRecord::Migration[6.0]
  def change
    remove_column :connectors, :url
  end
end
