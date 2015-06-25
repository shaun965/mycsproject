class User
	attr_accessor :name, :email

	def initialize(attributes = {})
		@name = attributes[:name]
		@email = attributes[:email]
	end

	def formatted_email
		"#{@name} <#{@email}>"
	end
end

def string_shuffle(s)
	s.split('').shuffle.join
end

class String
	def shuffle
		self.split('').shuffle.join
	end
end
