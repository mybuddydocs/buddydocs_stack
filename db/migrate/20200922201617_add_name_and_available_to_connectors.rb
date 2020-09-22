class AddNameAndAvailableToConnectors < ActiveRecord::Migration[6.0]
  def change
    add_column :connectors, :name, :string
    add_column :connectors, :available, :boolean, default: false
  end
end
