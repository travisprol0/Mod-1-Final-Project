class Controller
	attr_accessor :prompt 

	def initialize()
		@prompt = TTY::Prompt.new
	end

	def greetings
		puts "Welcome to Sampler Sounds"
		 prompt.select("What would you like to do?") do |menu|
	      menu.choice "Create a sampler", -> { puts "hi" }
	      menu.choice "Use an existing sampler", -> {choose_sampler}
	  	end
	end

	def choose_sampler
		prompt.select("Select an existing sampler") do |menu|
			menu.choice "Animals", -> {animals_board}
			menu.choice "Instruments", -> {puts "instruments sampler"}
		end
	end
	
	@animals_board = [""]
	
	def animals_board
		puts "this is the animals board"
	end

	# def display_animals_board
	# 	puts "| #{@animals_board[0]} | #{@animals_board[1]} |"
	# 	puts "---------"
	# 	puts "| #{@animals_board[2]} | #{@animals_board[3]} |"
	# end
	
	
	
	
	
	
	
	
	
	
	def define_board
        @board = [" ", " ", " ", " "]
    end

    def display_board
        puts "| #{@board[0]} | #{@board[1]} |"
        puts "---------"
        puts "| #{@board[2]} | #{@board[3]} |"
    end

end

