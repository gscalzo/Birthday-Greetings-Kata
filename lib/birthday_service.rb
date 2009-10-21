require "message"

class BirthdayService
	def initialize(host, port)
		@host = host
		@port = port
	end

	def send_greetings(employees, date)
		employees.born_on(date).each do |employee|
			send_message(Message.new employee)
		end
	end

	def send_message(message)
    		Net::SMTP.start(@host, @port) do |smtp|
      			smtp.send_message message.body, 'your@mail.address', message.to
    		end
	end



end
