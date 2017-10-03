require_relative "console_game.rb"

class Board 

attr_accessor :board 
	def initialize()
		@board = Array.new(9,"")
	end






def update_move(player, position)
	@board[position.to_i - 1] = player
	@board
end

def spot_open(position)
	
	if @board[position - 1] == 'x' || @board[position - 1] == 'o'
		false
	elsif position>= 10 || position<= 0
		false
	else
		true
	end
end

def change_player(player)
	if player == 'x'
		player = 'o'
		player 
	elsif player == 'o'
		player = 'x'
		player 
else
end
player
end


def set_character
	puts 'Would you like to play Tic-Tac-Toe?(y or n)'
	yes_or_no = 0
		until yes_or_no == 'y' or yes_or_no == 'n'
			yes_or_no = gets.chomp
	
				if yes_or_no == 'y'
					player_choice = ['x','o']
					player_one = player_choice.delete(player_choice.sample)

					player_two = player_choice.sample
					puts "\n" + "Player One is #{player_one}"
					puts "Player Two is #{player_two}" + "\n"
					puts "\n"
					"#{player_one.to_s}"
				elsif yes_or_no == 'n'
					puts 'See ya next time then'
					player_one = 'c'
					player_one
					false
				else
					puts 'Please enter a valid character(y or n)'
		end
end
player_one
end

def set_board
	board = ['1','2','3','4','5','6','7','8','9']
	board
end

def draw_board
	@board
	p "||=============||"
	p "|| #{@board[0]} || #{@board[1]} || #{@board[2]} ||"
	p "||=============||"
	p "|| #{@board[3]} || #{@board[4]} || #{@board[5]} ||"
	p "||=============||"
	p "|| #{@board[6]} || #{@board[7]} || #{@board[8]} ||"
	p "||=============||"
	puts "\n"
	puts "\n"
end


def win_state
    if @board[0] == "x" && @board[3] == "x" && @board[6] == "x"  || @board[0] == "o" && @board[3] == "o" && @board[6] == "o"
  		p "You Win"
  		true
    elsif @board[1] == "x" && @board[4] == "x" && @board[7] == "x" || @board[1] == "o" && @board[4] == "o" && @board[7] == "o"
        p "You Win"
        true
    elsif @board[2] == "x" && @board[5] == "x" && @board[8] == "x"  || @board[2] == "o" && @board[5] == "o" && @board[8] == "o"
        p "You Win"
      	true
    elsif @board[0] == "x" && @board[1] == "x" && @board[2] == "x"  || @board[0] == "o" && @board[1] == "o" && @board[2] == "o"
        p "You Win"
        true
    elsif @board[3] == "x" && @board[4] == "x" && @board[5] == "x"  || @board[3] == "o" && @board[4] == "o" && @board[5] == "o"
        p "You Win"
        true
    elsif @board[6] == "x" && @board[7] == "x" && @board[8] == "x"  || @board[6] == "o" && @board[7] == "o" && @board[8] == "o"
        p "You Win"
        true
    elsif @board[0] == "x" && @board[4] == "x" && @board[8] == "x"  || @board[0] == "o" && @board[4] == "o" && @board[8] == "o"
        p "You Win"
        true
    elsif @board[2] == "x" && @board[4] == "x" && @board[6] == "x"  || @board[2] == "o" && @board[4] == "o" && @board[6] == "o"
        p "You Win"
        true
    else
        false
    end
end

def test_for_full_board
    if @board.all? {|space| space.include?("x") || space.include?("o")}
       	puts "Draw Game, please play again!"
        board_full = true
    else
        board_full = false
    end
end

def game
	board = set_board
	player = set_character
	if player == "x" or player == "o"
			until  win_state || test_for_full_board 
					draw_board(board)
					puts "Player #{player.capitalize} Enter number of space you want"
					position = gets.chomp.to_i
						if spot_open(position)
								update = update_move(board, player, position)
								board = update
								draw_board(board)
								player = change_player(player)		
						else
						puts "Thats not a valid selection" + "\n"	
					end	
			end
elsif player == "c"	
	end	
	
end

end

