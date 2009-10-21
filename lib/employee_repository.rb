require 'employee'

class String
	def same_day?(other)
		date1 = split('/')
		date2 = other.split('/')
		date1[1] == date2[1] && date1[2] == date2[2] 
	end
end

class EmployeeRepository
	private
	def skip_header
		@employees.shift
	end

	public
	def initialize(employees_filename)
		@employees = []
		File.open(employees_filename).each_line do |line|			
			@employees << Employee.new(line)
		end
		skip_header
	end

	def size
		@employees.size	
	end

	def first
		@employees.first
	end

	def born_on(current_date)
		@employees.find_all { |e| e.birthdate.same_day?(current_date) }
	end
end
