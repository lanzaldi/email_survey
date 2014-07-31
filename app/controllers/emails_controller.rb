class EmailsController < ApplicationController

	before_filter :invite_required, :only => [:new, :create]
	

	def new
		@email = Email.new
	end
	
	def create
		@email = Email.new(email_params)
		@email.token = Digest::SHA256.new.hexdigest(@email.email)
		@email.number = 0
		
		if @email.save
			redirect_to thankyou_path
		else
			render 'new'
		end
	end
	
	def edit 
		@email = Email.new
	end
	
	def update
		@email = Email.new
		if params[:email][:email] =~ Email::EMAIL_REGEX
			@email = Email.find_by(email: params[:email][:email])
			if @email
				@email.update_attributes(update_params)
				@email.continue = false
				if @email.save
					redirect_to confirm_path
				else
					render 'edit'
				end
			else
				flash[:error] = "We don't have record of that email address."
				@email = Email.new
				@email.email = params[:email][:email]
				@email.why_no = params[:email][:why_no]
				render 'edit'
			end
		else
			flash[:error] = "Your email address is in an invalid format"
			@email.email = params[:email][:email]
			@email.why_no = params[:email][:why_no]
			render 'edit'
		end
	end
	
	private
		def email_params
			params.require(:email).permit(:email)
		end
		
		def update_params
			params.require(:email).permit(:why_no)
		end
		
		def invite_required
			if params[:token].nil?
				redirect_to error_path
			end
		end
end
