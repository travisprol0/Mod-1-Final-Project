class Controller
	attr_accessor :prompt 

	def initialize()
		@prompt = TTY::Prompt.new
	end

	def greetings
		puts "Welcome to Sampler Sounds"
		 prompt.select("What would you like to do?") do |menu|
	      menu.choice "Create a sampler", -> { puts " hi"  }
	      menu.choice "Use an existing sampler", -> { puts "hi"}
	  	end
	end

end

