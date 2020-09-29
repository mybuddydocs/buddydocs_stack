class AddConnectorToCredentials < ActiveRecord::Migration[6.0]
  def change
    add_reference :credentials, :connector, null: false, foreign_key: true
  end
end
