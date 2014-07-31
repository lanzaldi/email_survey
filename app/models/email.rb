class Email < ActiveRecord::Base
	validates :email, :token, :number, presence: true
	EMAIL_REGEX = /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/i
	validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
	
	def submitted_response
		if self.number == 12
			self.continue = false
			self.why_no = "Completed all surveys"
		else
			self.number = self.number + 12
		end
		
		self.reminder_needed = false
		self.save
	end
end
