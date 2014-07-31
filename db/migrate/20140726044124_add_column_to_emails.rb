class AddColumnToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :reminder_needed, :boolean
  end
end
