class SurveyUsersController < ApplicationController
	def new
		@survey_user = SurveyUser.new
		@survey = @survey_user.surveys.new
	end
	
	def start
		@survey_user = SurveyUser.new
	end
	
	def director
		@survey_user = SurveyUser.survey_profile(params[:survey_user][:code])
		if @survey_user.nil?
			@survey_user = SurveyUser.new
			@survey_user.code = params[:code]
			redirect_to new_survey_user_path(code: params[:survey_user][:code])
		else
			redirect_to new_survey_path(code: params[:survey_user][:code])
		end
	end
			
	
	def create
		@survey_user = SurveyUser.new(survey_user_params)
		@survey_user.code = params[:code]
		if @survey_user.save
			redirect_to new_survey_path(code: params[:code])
		else
			render 'new'
		end
		
	end	

	private
		def survey_user_params
			params.require(:survey_user).permit(:code, :gender, :age, :person_type, :education, :length_of_time_ms, :length_of_time_care, :ms_type)
		end
end
