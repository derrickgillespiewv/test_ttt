class Human
	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(ttt_board)
		puts "It's #{marker}'s turn."
		puts "Make a move"
		move = gets.chomp.to_i - 1

	
 

		#for the random one use a .sample

		if ttt_board[move] == "" && move <= 9  && move >= 0
			move
		else
			puts "Invalid Choice"
			get_move(ttt_board)
		end
	end
end