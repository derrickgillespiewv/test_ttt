require "minitest/autorun"
require_relative "board.rb"

class TestTicTac < Minitest::Test
			
			def test_board_new
			b_v = Board.new
			assert_equal(Array.new(9,''), b_v.ttt_board )
			end

			def test_update
			b_v = Board.new
			b_v.update_position(0,"x")

			assert_equal(['x','','','','','','','',''], b_v.ttt_board )
			end

			def test_update_2
			b_v = Board.new
			b_v.update_position(0,"x")
			b_v.update_position(8,"o")
			assert_equal(['x','','','','','','','','o'], b_v.ttt_board )
			end
end

# def get_win(ttt_board)
#         get_win_or_block(ttt_board, marker)
#     end

#     def get_block(ttt_board)
#         get_win_or_block(ttt_board, opponent)
#     end

#     def create_fork(ttt_board)
#         get_fork_or_block(ttt_board, marker)
#     end

#     def defend(ttt_board)
#       get_force_def(ttt_board, marker, opponent)
#     end

#     def block_fork(ttt_board)
#         get_fork_or_block(ttt_board, opponent)
#     end

#     def center(ttt_board)
#         get_center(ttt_board)
#     end

#     def opp(ttt_board)
#       get_opposite_corner(ttt_board, opponent)
#     end

#     def corner(ttt_board)
#       get_corner(ttt_board)
#     end

#     def edge(ttt_board)
#       get_edge(ttt_board)
#     end


#       def get_move
#         move = 70

#         if 
#             get_win(ttt_board) <= 8
#             move = get_win(ttt_board)
     
#         elsif
#             get_block(ttt_board) <= 8
#             move = get_block(ttt_board)
        

#         elsif
#             create_fork(ttt_board) <= 8
#             move = create_fork(ttt_board)

#         elsif
#             defend(ttt_board) <= 8
#             move = defend(ttt_board)

#        elsif
#             block_fork(ttt_board) <= 8
#             move = block_fork(ttt_board)
#         elsif 
#             center(ttt_board) <= 8
#             move = center(ttt_board)

#         elsif
#             opp(ttt_board) <= 8
#             move = opp(ttt_board)

#         elsif
#             corner(ttt_board) <= 8
#             move = corner(ttt_board)

#         elsif
#             edge(ttt_board) <= 8
#             move = edge(ttt_board)
#         else
#             move = ttt_board.index('')
        
#         end
#         move
#     end
#     move
#   end
