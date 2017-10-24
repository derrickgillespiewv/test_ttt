require "minitest/autorun"
require_relative "console_sequential.rb"

class TestTicTac < Minitest::Test
			
			def test_marker
			b_v = Sequential.new('x')
			assert_equal("x", b_v.marker)
			end

			def test_move
			b_v = Sequential.new('x')
			assert_equal(0, b_v.get_move(['','','','','','','','','']))
			end


			def test_move_1
			b_v = Sequential.new('x')
			assert_equal(1, b_v.get_move(['x','','','','','','','','']))
			end

			def test_move_2
			b_v = Sequential.new('x')
			assert_equal(1, b_v.get_move(['x','','','','','','','','']))
			end
		end