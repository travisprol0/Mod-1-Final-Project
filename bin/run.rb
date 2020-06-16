require_relative '../config/environment'

	controller_instance = Controller.new
	logged_in_user = controller_instance.greetings()

board = controller_instance.define_board()
controller_instance.display_board()
binding.pry
puts "hello world"
