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

	def define_board
        @board = [" ", " ", " ", " "]
    end

    def display_board
        puts "| #{@board[0]} | #{@board[1]} |"
        puts "---------"
        puts "| #{@board[2]} | #{@board[3]} |"
    end

end

