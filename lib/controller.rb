class Controller
	attr_accessor :prompt, :sound
	def initialize()
		@prompt = TTY::Prompt.new
	end
	def greetings
		puts "Welcome to Sampler Sounds"
		 prompt.select("What would you like to do?") do |menu|
	      menu.choice "Create a sampler", -> {create_sampler}
		  menu.choice "Use an existing sampler", -> {choose_sampler}
		  menu.choice "Delete a sampler", -> {destroy_sampler}
		  menu.choice "Update a sampler", -> {update_sampler}
	  	end
	end

	def choose_sampler
		samplers = Sampler.all.map {|sampler| {sampler.name => sampler.id}}
		menu = "Return to Main Menu"
		sampler_id = prompt.select("Select an existing sampler", samplers)
		@chosen_sampler = Sampler.find_by(id: sampler_id)
		board
		end
	end
	def board
		@board = @chosen_sampler.sounds.map {|sound| sound.emoji}
		display_board
	end

	def display_board
		@new_board = (
		puts "| #{@board[0]} | #{@board[1]} |"
		puts "---------"
		puts "| #{@board[2]} | #{@board[3]} |")
		puts ""
		puts 'Select a number 1-4 to hear the sound, or type "return" to return to main menu'
		puts_sounds
	end

	def puts_sounds
			answer = gets.chomp
			if answer.length == 1
				answer = answer.to_i
				answer = answer - 1
				if answer > 3 || answer < 0
					puts 'Select a number 1-4 to hear the sound, or type "return" to return to main menu'
					sleep(2)
					display_board
				else
					@sounds = @chosen_sampler.sounds.map {|sound|sound.noise}
					puts @sounds[answer]
					display_board
				end
			elsif
				answer == "return" || answer == '"return"'
				greetings
			else
				puts 'Select a number 1-4 to hear the sound, or type "return" to return to main menu'
					sleep(2)
					display_board
			end

	end

	def create_sampler
		sampler_name = prompt.ask("What is the name of your new sampler?", required: true)
		@new_sampler = Sampler.create(name: sampler_name)
		add_emojis
	end

	def add_emojis
		@all = []
		def add_first_emoji
			puts "Select your first emoji!"
			emoji = Sound.all.map {|sounds| {sounds.emoji => sounds.noise}}
			@@first_emoji = prompt.select("Select an emoji", emoji)
			sound = Sound.find_by(noise: @@first_emoji)
			SamplerSound.create(sound_id: sound.id, sampler_id: @new_sampler.id )
			@all << sound
			add_second_emoji
		end

		def add_second_emoji
			puts "Select your second emoji!"
			emoji = Sound.all.map {|sounds| {sounds.emoji => sounds.noise}}
			@@second_emoji = prompt.select("Select an emoji", emoji)
			sound = Sound.find_by(noise: @@second_emoji)
			SamplerSound.create(sound_id: sound.id, sampler_id: @new_sampler.id )			
			@all << sound
			add_third_emoji
		end

		def add_third_emoji
			puts "Select your third emoji!"
			emoji = Sound.all.map {|sounds| {sounds.emoji => sounds.noise}}
			@@third_emoji = prompt.select("Select an emoji", emoji)
			sound = Sound.find_by(noise: @@third_emoji)
			SamplerSound.create(sound_id: sound.id, sampler_id: @new_sampler.id )			
			@all << sound
			add_fourth_emoji
		end
		def add_fourth_emoji
			puts "Select your fourth emoji!"
			emoji = Sound.all.map {|sounds| {sounds.emoji => sounds.noise}}
			@@fourth_emoji = prompt.select("Select an emoji", emoji)
			sound = Sound.find_by(noise: @@fourth_emoji)
			SamplerSound.create(sound_id: sound.id, sampler_id: @new_sampler.id )			
			@all << sound
			# chicken
			greetings
			puts ""
		end
		# def chicken
		# 	emojis = @all.map {|emoji| emoji.emoji}
		# 	@new_board = (
		# 		puts "| #{emojis[0]} | #{emojis[1]} |"
		# 		puts "---------"
		# 		puts "| #{emojis[2]} | #{emojis[3]} |")
		# 		puts ""
		# 		puts 'Select a number 1-4 to hear the sound, or type "return" to return to main menu'
		# 		puts_sounds
		# 	end
			
		# def puts_sounds
		# 	answer = gets.chomp
		# 	if answer.length == 1
		# 		answer = answer.to_i
		# 		answer = answer - 1
		# 		if answer > 3 || answer < 0
		# 			puts 'Select a number 1-4 to hear the sound, or type "return" to return to main menu'
		# 			sleep(2)
		# 			display_board
		# 		else
		# 			@sounds = @chosen_sampler.sounds.map {|sound|sound.noise}
		# 			puts @sounds[answer]
		# 			display_board
		# 		end
		# 	elsif
		# 		answer == "return" || answer == '"return"'
		# 		greetings
		# 	else
		# 		puts 'Select a number 1-4 to hear the sound, or type "return" to return to main menu'
		# 			sleep(2)
		# 			display_board
		# 	end
		add_first_emoji

	end
	# end


	def update_sampler
		puts "Here are your samplers: #{Sampler.all.map{|sampler| sampler.name}}"
		old_name = prompt.ask("Which do you want to update?", required: true)
		sampler_object = Sampler.all.find_by(name: old_name)
		new_name = prompt.ask("Which do you want to rename your sampler?", required: true)
		sampler_object.update(name: new_name)
		binding.pry
	end
	

	def destroy_sampler
		if Sampler.count == 0
			puts "You have no samplers!"
			sleep(2)
			greetings
		else
			puts "Here are your samplers:
			#{Sampler.all.map{|sampler| sampler.name}}"
			sampler_to_destroy = prompt.ask("Type the name of the sampler you would like to delete", required: true)
			Sampler.find_by(name: sampler_to_destroy).destroy
			puts "#{sampler_to_destroy} has been deleted!"
			sleep(2)
			greetings
	end




end


	# def update_sampler
	# 	puts "Here are your samplers: #{Sampler.all.map{|sampler| sampler.name}}"
	# 	name_of_sampler_to_update = prompt.ask("which do you want to update?", required: true)
	# 	hi = Sampler.all.find_by(name: sampler_to_update)
	# 	binding.pry
	# end



# def greetings
# 		puts "Welcome to Sampler Sounds"
# 		 prompt.select("What would you like to do?") do |menu|
# 	      menu.choice "Create a sampler", -> {create_sampler}
# 		  menu.choice "Use an existing sampler", -> {choose_sampler}
# 		  menu.choice "Delete a sampler", -> {destroy_sampler}
# 	  	end
# 	end