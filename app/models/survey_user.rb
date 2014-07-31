class SurveyUser < ActiveRecord::Base
	
  	validates_presence_of :code, :person_type, :age, :gender, :education
	validates_uniqueness_of :code
	validates_presence_of :care_for, :length_of_time_care, :unless => Proc.new { |s| s.person_type == "ms" }
	
	validates_presence_of :ms_type, :length_of_time_ms, :if => Proc.new { |s| s.person_type == "ms" }
	
	has_many :surveys, :inverse_of => :survey_user, :dependent => :destroy
	accepts_nested_attributes_for :surveys, :allow_destroy => true		
	
	def self.survey_profile (code)
		SurveyUser.find_by(code: code)
	end
	
	def ms?
		self.person_type == "ms"
	end

end
