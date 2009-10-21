$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'rumbster'
require 'message_observers'
require 'net/smtp'
require 'gserver'
require 'birthday_service'
require 'employee_repository'


describe "Greetings Service" do
	NON_STANDARD_PORT = 10015
	def send_message(to, message)
    		Net::SMTP.start('localhost', NON_STANDARD_PORT) do |smtp|
      			smtp.send_message message, 'your@mail.address', to
    		end
	end

	before :each do
	 	@rumbster =  Rumbster.new(NON_STANDARD_PORT)   	
   		@message_observer = MailMessageObserver.new
		@rumbster.add_observer @message_observer
		@rumbster.start

		@birthdayService = BirthdayService.new("localhost", NON_STANDARD_PORT);
	end

	after :each do
		@rumbster.stop
	end
	
	context "with a file with one person born today" do
		before :each do
			@birthdayService.send_greetings EmployeeRepository.new("employee_data.txt"), "2008/10/08"
		end

		it "should send one email" do
			@message_observer.messages.size.should == 1
		end

		it "should send correct message" do
			@message_observer.messages.first.subject.should == "Happy Birthday!"
			@message_observer.messages.first.body.chomp.should == "Happy Birthday, dear John!"
			@message_observer.messages.first.to.should == ["john.doe@foobar.com"]
		end
	end

end

