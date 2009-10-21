$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require "employee"

describe "Employee" do
	before :each do
		@employee = Employee.new("Doe, John, 1982/10/08, john.doe@foobar.com")
	end
	it "should have a first name, a last name, a birth date and an email address" do
		@employee.firstname.should == "John"
		@employee.lastname.should == "Doe"
		@employee.birthdate.should == "1982/10/08"
		@employee.email.should == "john.doe@foobar.com"
	end
	it "should be equal to an other employee with same data" do
		@employee.should == Employee.new("Doe, John, 1982/10/08, john.doe@foobar.com")
	end
	it "should be different from other kind of object" do
		@employee.should_not == "dummy"
		"dummy".should_not == @employee
	end
end
