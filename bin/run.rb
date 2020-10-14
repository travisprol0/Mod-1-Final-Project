require_relative '../config/environment'

	controller_instance = Controller.new
	logged_in_user = controller_instance.greetings()

puts "this is the run file"
