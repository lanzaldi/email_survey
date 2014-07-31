class CreateSurveyUsers < ActiveRecord::Migration
  def change
    create_table :survey_users do |t|
		t.string :code
		t.string :person_type
		t.string :gender
		t.string :age
		t.string :education
		t.string :ms_type
		t.string :length_of_time
		t.string :care_for
		t.string :why_no
		t.boolean :continue
      t.timestamps
    end
  end
end
