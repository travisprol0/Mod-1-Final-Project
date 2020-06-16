class Controller
	attr_accessor :prompt, :sound

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
		samplers = Sampler.all.map {|sampler| {sampler.name => sampler.id}}
		sampler_id = prompt.select("Select an existing sampler", samplers)		#array of hashes, iterate through Sampler.all, key is name of sampler, value is id of the sampler 
		@chosen_sampler = Sampler.find_by(id: sampler_id)
		animals_board
	end
	
	
	def animals_board
		@animals_board = @chosen_sampler.sounds.map {|sound| sound.emoji}
		display_animals_board
		# @animals_board = ["🐶","🐱","🐸","🦊"]
		# display_animals_board
		# "Use numbers to select an emoji. 1 is the top left, 4 is the bottom right."
	end

	def display_animals_board
		puts "| #{@animals_board[0]} | #{@animals_board[1]} |"
		puts "---------"
		puts "| #{@animals_board[2]} | #{@animals_board[3]} |"
	end
	
	
	
	
	
	
	
	# def play_sounds
	# 	puts "Use numbers to select an emoji. 1 is the top left, 4 is the bottom right."
	# 	user_input = gets.chomp
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
	# Sound.create(emoji: "🐶", noise: "woof")
	# Sound.create(emoji: "🐱", noise: "meow")
	# Sound.create(emoji: "🐸", noise: "ribbbbiiiit")
	# Sampler.create(name: "Animals", sampler_id: 1)
	# animals = SamplerSound.where("sampler_id = 1" )
	# animal_emoji = animals.map{|animal| animal.sound}
	# animal_emoji.map{|animal| animal.emoji}

	# dog = Sound.create(emoji: "🐶", noise: "woof")
	# cat = Sound.create(emoji: "🐱", noise: "meow")
	# frog = Sound.create(emoji: "🐸", noise: "ribbbbiiiit")
	# fox = Sound.create(emoji: "🦊", noise: "rooooor")
	# cow = Sound.create(emoji: "🐮", noise: "mooo")
	# duck = Sound.create(emoji: "🦆", noise: "quack!!!")

	# guitar = Sound.create(emoji: "🎸", noise: "guitar")
	# piano = Sound.create(emoji: "🎹", noise: "piano")
	# trumpet = Sound.create(emoji: "🎺", noise: "trumpet")
	# violen = Sound.create(emoji: "🎻", noise: "violin")
	# banjo = Sound.create(emoji: "🪕", noise: "banjo")
	# sax = Sound.create(emoji: "🎷", noise: "Saxophone")

	# animals = Sampler.create(name: "Animals")
	# music = Sampler.create(name: "Music")


end



