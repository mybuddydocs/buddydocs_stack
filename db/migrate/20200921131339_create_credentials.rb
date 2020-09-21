class CreateCredentials < ActiveRecord::Migration[6.0]
  def change
    create_table :credentials do |t|
      t.string :url
      t.string :password
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
