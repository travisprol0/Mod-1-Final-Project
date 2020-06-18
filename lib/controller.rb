system "clear"

class Controller
	attr_accessor :prompt, :sound
	def initialize()
		@prompt = TTY::Prompt.new
		#keypress
		prompt.on(:keypress) do |event|
		  if event.value == 'q'
				prompt.select("") do |menu|
		  		menu.choice "Go back to main menu", -> {greetings}
		  end
		end
		end
	end
	
	def greetings
		system "clear"
		puts "Welcome to Sampler Sounds"
		 prompt.select("What would you like to do?") do |menu|
	      menu.choice "Create a sampler", -> {create_sampler}
		  menu.choice "Use an existing sampler", -> {choose_sampler}
		  menu.choice "Update a sampler", -> {update_sampler}
		  menu.choice "Delete a sampler", -> {destroy_sampler}
	  	end
	end

	def choose_sampler
		samplers = Sampler.all.map {|sampler| {sampler.name => sampler.id}}
		sampler_id = prompt.select("Select an existing sampler", samplers)
		@chosen_sampler = Sampler.find_by(id: sampler_id)
		board
	end
	def board
		@board = @chosen_sampler.sounds.map {|sound| sound.emoji}
		display_board
	end

	def display_board
				system "clear"
		@new_board = (
		puts "            "
		puts "			    Your Sampler: #{@chosen_sampler.name}	".colorize(:yellow)
		puts "            "		
		puts "                                ===========".colorize(:yellow)
		puts "				| #{@board[0]} | #{@board[1]} |"
		puts "				―――――――――――".colorize(:yellow)
		puts "				| #{@board[2]} | #{@board[3]} |")
		puts "                                ==========="	.colorize(:yellow)	
		puts ""
		puts "            "		

		puts '		  Select a number 1-4 to hear the sound'.colorize(:yellow)	
		puts '		  Type "return" to return to main menu'.colorize(:yellow)	
		puts_sounds
	end

	def puts_sounds
			answer = gets.chomp
			if answer.length == 1
				answer = answer.to_i
				answer = answer - 1
				if answer > 3 || answer < 0
					puts '                    ** select a number from 1-4 **'.colorize(:red)
					sleep(1)
					system "clear"
					display_board
				else
					@sounds = @chosen_sampler.sounds.map {|sound|sound.noise}
					@sounds = @sounds[answer]
					pid = fork{ exec 'afplay', "./db/audio/#{@sounds}.mp3" }
					sleep(1)
					system "clear"
					display_board
				end
			elsif
				answer == "return" || answer == '"return"'
				greetings
			else
				puts '                    ** select a number from 1-4 **'.colorize(:red)
					sleep(1)
					system "clear"
					display_board
			end

	end

	def create_sampler
		@sampler_name = prompt.ask("What is the name of your new sampler?", required: true)
		@new_sampler = Sampler.create(name: @sampler_name)
		
		def add_emojis
			@all = []
			def add_first_emoji
				puts "Select your first emoji!"
				emoji = Sound.all.map {|sounds| {sounds.emoji => sounds}}
				@sound_arr = prompt.multi_select("Select 4 emojis Using Your Space 🚀 bar", emoji, min:4, max:4)
				@i = 0 
				while @i < 4
					SamplerSound.create(sound_id: @sound_arr[@i].id, sampler_id: @new_sampler.id )
					@i += 1
				end
							# binding.pry
				@all << @sound_arr
				puts "#{@sampler_name} has been created"
		
			# binding.pry

				prompt.select("Would you like to:") do |menu|
					menu.choice "Use #{@sampler_name}", -> {use_sampler_name}
					menu.choice "Return to main menu", -> {greetings}
				end				
			end

				def use_sampler_name
					sampler_id = Sampler.last.id
					@chosen_sampler = Sampler.find_by(id: sampler_id)
					board
				end
			add_first_emoji
		end
		add_emojis
	end

	def update_sampler
		@new_emojis = []
		samplers = Sampler.all.map {|sampler| {sampler.name => sampler.id}}
		sampler_id = prompt.select("Select a sampler to update", samplers)
		@chosen_sampler = Sampler.find_by(id: sampler_id)

		
		
		def update_name
			@new_name = prompt.ask("Which do you want to rename your sampler?", required: true)
			@chosen_sampler.update(name: @new_name)
			
			# binding.pry
			puts "Your sampler has been updated"
			sleep(2)
			greetings
		end
		
		def update_emojis
			sampler_sounds = SamplerSound.all.select {|sound| sound.sampler_id == @chosen_sampler.id}
			



			#update sound_id
			
			# 1. Select all SamplerSounds for this sampler
			# 2. Iterate through all samplerSounds				for loop?
			# 3. Change sounds
			
			
			puts "Feature coming soon!"
			# binding.pry
			sleep(2)
			greetings


			# puts "Select your first emoji!"
			# 	emoji = Sound.all.map {|sounds| {sounds.emoji => sounds}}
			# 	binding.pry
			# 	@sound_arr = prompt.multi_select("Select 4 emojis Using Your Space 🚀 bar", emoji, min:4, max:4)
			# 	SamplerSound.create(sound_id: @sound_arr[0].id, sampler_id: @new_sampler.id )
			# 	@i = 0 
			# 	while @i < 4
			# 		SamplerSound.create(sound_id: @sound_arr[@i].id, sampler_id: @new_sampler.id )
			# 		@i += 1
			# 	end
			# 	@new_emojis << @sound_arr
		end
		
		# prompt.select("What would you like to do?") do |menu|
			# menu.choice "Update name", -> {update_name}
			# menu.choice "Update emojis", -> {update_emojis}
		# end
		update_name
		
	end
	
	def destroy_sampler
		if Sampler.count == 0
			puts "You have no samplers!"
			sleep(1)
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
end