require "minitest/autorun"
require_relative "tictac.rb"

class TestTicTac < Minitest::Test

  	def test_1_to_1
 		assert_equal(1,1)
	end  

	def test_first_spot
		board = ['1','2','3','4','5','6','7','8','9']
		assert_equal(['x','2','3','4','5','6','7','8','9'], update_move(board, 'x', '1'))
	end

	def test_second_spot
		board = ['x','2','3','4','5','6','7','8','9']
		assert_equal(['x','2','3','4','5','6','o','8','9'], update_move(board, 'o', '7'))
	end

	def test_spot_legal
		board = ['x','2','3','4','5','6','o','8','9']
		position = 8
		assert_equal(true, spot_open(board, position)) 
	end 


	def test_spot_ten
		board = ['x','2','3','4','5','6','o','8','9']
		position = 10
		assert_equal(false, spot_open(board, position)) 
	end 


	def test_spot_negative
		board = ['x','2','3','4','5','6','o','8','9']
		position = 0
		assert_equal(false, spot_open(board, position)) 
	end 


	def test_player
		assert_equal('x', change_player('o'))
	end

	def test_player
		assert_equal('o', change_player('x'))
	end

	def  test_full_board
        board = ['x', 'o', 'x', 'o', 'x', 'o', 'x', 'o', 'x']
        assert_equal(true, test_for_full_board(board))
    end

    def  test_not_full_board
        board = ['1', '2', 'x', 'o', 'x', 'o', 'x', 'o', 'x']
        assert_equal(false, test_for_full_board(board))
    end
	
	def test_game_win
		board = ['x', 'x', 'x', 'o', 'x', 'o', 'x', 'o', 'x']
		assert_equal(true, win_state(board))
	end

	def test_board
		assert_equal(['1','2','3','4','5','6','7','8','9'], (set_board))
	end

	def test_cat_name
		animal = Cat.new("Fluff")
		assert_equal("Fluff", animal.name)
	end
end




