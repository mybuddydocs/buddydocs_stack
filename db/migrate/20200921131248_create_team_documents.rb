class CreateTeamDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :team_documents do |t|
      t.references :team, null: false, foreign_key: true
      t.references :document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
