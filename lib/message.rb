class Message
	def initialize(employee)
		@employee = employee	
	end

	def to
		@employee.email
	end
	
	def body
		["To: #{to}",
		"Subject: Happy Birthday!",
		"",
		"Happy Birthday, dear #{@employee.firstname}!"].join("\n")
	end
	
end
