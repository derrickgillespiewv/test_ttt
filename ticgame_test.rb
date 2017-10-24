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


			def test_valid_spot
			b_v = Board.new
			b_v.update_position(8,"o")
			
			assert_equal(false, b_v.valid_position?(8))
			end


			def test_valid_spot_2
			b_v = Board.new
			b_v.update_position(8,"o")
			
			assert_equal(true, b_v.valid_position?(7))
			end

			def test_valid_input
			b_v = Board.new
			b_v.update_position(8,"o")
			
			assert_equal(false, b_v.valid_input?("k"))
			end

			def test_valid_input_2
			b_v = Board.new
			b_v.update_position(8,"o")
			
			assert_equal(true, b_v.valid_input?("x"))
			end

			def test_full_board
			b_v = Board.new
			b_v.ttt_board = ['x','x','x','x','x','x','x','x','o']
			assert_equal(true, b_v.full_board? )
			end

			def test_full_board_2
			b_v = Board.new
			b_v.ttt_board = ['x','x','x','x','x','x','x','x','']
			assert_equal(false, b_v.full_board? )
			end

				def test_win
			b_v = Board.new
			b_v.ttt_board = ['x','x','x','x','x','x','x','x','']
			assert_equal(true, b_v.winner?("x"))
			end

				def test_win_2
			b_v = Board.new
			b_v.ttt_board = ['','','','','','','x','x','']
			assert_equal(false, b_v.winner?("x"))
			end
end

