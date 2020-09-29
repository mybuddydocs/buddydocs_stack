class AddLoginToCredentials < ActiveRecord::Migration[6.0]
  def change
    add_column :credentials, :login, :string
  end
end
