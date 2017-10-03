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