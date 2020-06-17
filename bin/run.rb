require_relative '../config/environment'

	controller_instance = Controller.new
	logged_in_user = controller_instance.greetings()
	snare_sound = pid = fork{ exec 'afplay', "/Users/AndyXcode/flatiron/code/PROJECTS/Mod-1-Final-Project/audio/snare.mp3" }

# board = controller_instance.define_board()
# controller_instance.display_board()
binding.pry
puts "this is the run file"

