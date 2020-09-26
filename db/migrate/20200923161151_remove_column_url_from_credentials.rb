class RemoveColumnUrlFromCredentials < ActiveRecord::Migration[6.0]
  def change
    remove_column :credentials, :url
  end
end
