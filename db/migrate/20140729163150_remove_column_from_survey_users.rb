class RemoveColumnFromSurveyUsers < ActiveRecord::Migration
  def change
    remove_column :survey_users, :why_no, :string
    remove_column :survey_users, :continue, :string
  end
end
