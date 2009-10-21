class Employee
	attr_reader :firstname
	attr_reader :lastname
	attr_reader :birthdate
	attr_reader :email
	def initialize(args)
		tokens = args.split(',').map { |e| e.strip }
		@firstname = tokens[1]
		@lastname = tokens[0]
		@birthdate = tokens[2]
		@email = tokens[3]
	end

	def ==(other)
		other.instance_of?(self.class) && 
			@firstname == other.firstname && 
			@lastname == other.lastname && 
			@birthdate == other.birthdate && 
			@email == other.email
	end
end
