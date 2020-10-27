class ChangeContentToBeTextInPages < ActiveRecord::Migration[6.0]
  def change
    change_column :pages, :content, :text
  end
end
