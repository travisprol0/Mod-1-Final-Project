class Controller
	attr_accessor :prompt, :sound

	def initialize()
		@prompt = TTY::Prompt.new
	end

	def greetings
		puts "Welcome to Sampler Sounds"
		 prompt.select("What would you like to do?") do |menu|
	      menu.choice "Create a sampler", -> { create_sampler }
		  menu.choice "Use an existing sampler", -> {choose_sampler}
		  menu.choice 
	  	end
	end

	def choose_sampler
		samplers = Sampler.all.map {|sampler| {sampler.name => sampler.id}}
		sampler_id = prompt.select("Select an existing sampler", samplers)		#array of hashes, iterate through Sampler.all, key is name of sampler, value is id of the sampler 
		@chosen_sampler = Sampler.find_by(id: sampler_id)
		board		#generalize this
	end
	
	
	def board
		@board = @chosen_sampler.sounds.map {|sound| sound.emoji}
		display_board
		# @animals_board = ["🐶","🐱","🐸","🦊"]
		# display_animals_board
		# "Use numbers to select an emoji. 1 is the top left, 4 is the bottom right."
	end

	def display_board
		@new_board = (
		puts "| #{@board[0]} | #{@board[1]} |"
		puts "---------"
		puts "| #{@board[2]} | #{@board[3]} |")
		puts ""
		puts "Select a number 1-4"

		puts_sounds


	end

	def puts_sounds
			answer = gets.chomp
			answer = answer.to_i
			answer = answer - 1
			
			if answer > 3 || answer <= 0
				puts "Please choose a number between 1-4"
				sleep(2)
				display_board
			else
				@sounds = @chosen_sampler.sounds.map {|sound|sound.noise}
				puts @sounds[answer]
				display_board
			end
	end
	
	def create_sampler
		puts "Enter the name of your new sampler!"
		sampler_name = gets.chomp
		Sampler.create(name: sampler_name)
		add_emojis
	end

	def add_emojis
		@@all = []

		def add_first_emoji
			puts "Select your first emoji!"
			emoji = Sound.all.map {|sounds| {sounds.emoji => sounds.emoji}}
			@@first_emoji = prompt.select("Select an emoji", emoji)
			@@all << @@first_emoji
			add_second_emoji
		end
		def add_second_emoji
			puts "Select your second emoji!"
			emoji = Sound.all.map {|sounds| {sounds.emoji => sounds.emoji}}
			@@second_emoji = prompt.select("Select an emoji", emoji)
			@@all << @@second_emoji
			add_third_emoji
		end

		def add_third_emoji
			puts "Select your third emoji!"
			emoji = Sound.all.map {|sounds| {sounds.emoji => sounds.emoji}}
			@@third_emoji = prompt.select("Select an emoji", emoji)
			@@all << @@third_emoji
			add_fourth_emoji
		end

			def add_fourth_emoji
			puts "Select your fourth emoji!"
			emoji = Sound.all.map {|sounds| {sounds.emoji => sounds.emoji}}
			@@fourth_emoji = prompt.select("Select an emoji", emoji)
			@@all << @@fourth_emoji
			idk
		end
		add_first_emoji
	end

	def idk
		@@all
		@new_board = (
		puts "| #{@@all[0]} | #{@@all[1]} |"
		puts "---------"
		puts "| #{@@all[2]} | #{@@all[3]} |")
		puts ""
		puts "Select a number 1-4"

	end

end


# samplers = Sampler.all.map {|sampler| {sampler.name => sampler.id}}
# sampler_id = prompt.select("Select an existing sampler", samplers)
