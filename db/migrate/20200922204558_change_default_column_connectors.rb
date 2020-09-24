class ChangeDefaultColumnConnectors < ActiveRecord::Migration[6.0]
  def change
    change_column_default :connectors, :available, from: false, to: true
  end
end
