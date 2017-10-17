require_relative 'web_game.rb'
require_relative 'console_game.rb'

def run_console
game = Console_game.new

game.intro

until game.check_winner || game.board.full_board?

	# game.display_board
	game.change_player
	game.update_board
	
end

if game.check_winner
	# game.display_board
	puts "#{game.active_player.marker} wins!"
else
	# game.display_board
	puts "The cat got this one!"
end
end

def run_web
game = Web_game.new

game.intro

until game.check_winner || game.board.full_board?

	# game.display_board
	game.change_player
	game.update_board
	
end

if game.check_winner
	# game.display_board
	puts "#{game.active_player.marker} wins!"
else
	# game.display_board
	puts "The cat got this one!"
end
end
run_console