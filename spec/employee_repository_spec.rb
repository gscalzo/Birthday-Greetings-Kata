$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require "employee_repository"

describe "EmployeeRepository" do
	it "should read Employees from a file" do
		repository = EmployeeRepository.new "employee_data.txt"
	end
	
	it "should have a well know size" do
		repository = EmployeeRepository.new "employee_data.txt"
		repository.size.should == 3
	end
	it "should return first employee" do
		repository = EmployeeRepository.new "employee_data.txt"
		expected_employee = Employee.new("Doe, John, 1982/10/08, john.doe@foobar.com")
		repository.first.should == expected_employee
	end
	it "should return employees born an a given date" do
		repository = EmployeeRepository.new "employee_data.txt"
		expected_employee = Employee.new("Doe, John, 1982/10/08, john.doe@foobar.com")
		repository.born_on('2008/10/08').first.should == expected_employee
	end
end
