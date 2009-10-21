$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require "message"
require "employee"

describe "Message" do
	before :each do
		@message = Message.new Employee.new("Doe, John, 1982/10/08, john.doe@foobar.com")
	end

	it "should have employee's email as destination" do
		@message.to.should == "john.doe@foobar.com"
	end
	it "should construct a complete body" do
		@message.body.should == "To: john.doe@foobar.com\nSubject: Happy Birthday!\n\nHappy Birthday, dear John!"
	end
end

