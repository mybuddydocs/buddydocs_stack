class AddReminderDateToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :reminder_date, :date
  end
end
