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

	# animal-board
	Sound.create(emoji: "🐶", noise: "woof")
	Sound.create(emoji: "🐱", noise: "meow")
	Sound.create(emoji: "🐸", noise: "ribbbbiiiit")
	Sampler.create(name: "Animals", sampler_id: 1)
	animals = SamplerSound.where("sampler_id = 1" )
	animal_emoji = animals.map{|animal| animal.sound}
	animal_emoji.map{|animal| animal.emoji}

	dog = Sound.create(emoji: "🐶", noise: "woof")
cat = Sound.create(emoji: "🐱", noise: "meow")
frog = Sound.create(emoji: "🐸", noise: "ribbbbiiiit")
fox = Sound.create(emoji: "🦊", noise: "rooooor")
cow = Sound.create(emoji: "🐮", noise: "mooo")
duck = Sound.create(emoji: "🦆", noise: "quack!!!")

guitar = Sound.create(emoji: "🎸", noise: "guitar")
piano = Sound.create(emoji: "🎹", noise: "piano")
trumpet = Sound.create(emoji: "🎺", noise: "trumpet")
violen = Sound.create(emoji: "🎻", noise: "violin")
banjo = Sound.create(emoji: "🪕", noise: "banjo")
sax = Sound.create(emoji: "🎷", noise: "Saxophone")

animals = Sampler.create(name: "Animals")
music = Sampler.create(name: "Music")


end



