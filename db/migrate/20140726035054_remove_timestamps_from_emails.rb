class RemoveTimestampsFromEmails < ActiveRecord::Migration
  def change
    remove_column :emails, :created_at, :string
    remove_column :emails, :updated_at, :string
  end
end
