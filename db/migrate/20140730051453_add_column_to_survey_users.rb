class AddColumnToSurveyUsers < ActiveRecord::Migration
  def change
    add_column :survey_users, :length_of_time_care, :string
	rename_column :survey_users, :length_of_time, :length_of_time_ms
  end
end
