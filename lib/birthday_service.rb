class BirthdayService
	def initialize(host, port)
		@host = host
		@port = port
	end

	def send_greetings(employees_filename, date)
		input_file = File.new employees_filename
		employees = []
		first=true
		File.open(employees_filename).each_line{ |s|
			if(!first) then
				tokens = s.split ','
				data_nascita = tokens[2]
				born_today = data_nascita.split('/')[2]==date.split('/')[2] && data_nascita.split('/')[1]==date.split('/')[1]
  				employees << s if born_today
			else
				first = false
			end
		}
		employees.each do |employee|
			tokens=employee.split(',')
				to="#{tokens[3].strip.chomp}"
				message = "To: #{to}\nSubject: Happy Birthday!\n\nHappy Birthday, dear #{tokens[1].strip}!"
				send_message(to, message)
		end

	end

	def send_message(to, message)
    		Net::SMTP.start(@host, @port) do |smtp|
      			smtp.send_message message, 'your@mail.address', to
    		end
	end



end
