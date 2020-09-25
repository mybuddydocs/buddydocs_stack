class RemovePageNumberFromPages < ActiveRecord::Migration[6.0]
  def change
    remove_column :pages, :page_number
  end
end
