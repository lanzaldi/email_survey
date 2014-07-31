class SurveysController < ApplicationController
	before_filter :valid_survey_user
	
	def new
		@survey_user = SurveyUser.survey_profile(params[:code])
		@survey = Survey.new
	end
	
	def create
		@survey_user = SurveyUser.survey_profile(params[:code])
		@survey = @survey_user.surveys.build(survey_params)

		if @survey.save
			redirect_to thankyou_path
		else
			render 'new'
		end
	end
	
	def valid_survey_user
		if SurveyUser.survey_profile(params[:code]).nil?
			redirect_to start_path
		end
	end
	
	def survey_params
		params.require(:survey).permit(:marital_status, :employment, :pil1, :pil2, :pil3, :pil4, :pil5, :pil6, :pil7, :pil8, :pil9, :pil10, :pil11, :pil12, :pil13, :pil14, :pil15, :pil16, :pil17, :pil18, :pil19, :pil20, :disability, :last_exacerbation, :new_symptoms)
	end
		
end

