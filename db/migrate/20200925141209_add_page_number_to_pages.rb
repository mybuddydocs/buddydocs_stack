class AddPageNumberToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :page_number, :integer, default: 1
  end
end
