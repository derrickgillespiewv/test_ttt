

require "minitest/autorun"
require_relative "unbeat.rb"

class TestTicTac < Minitest::Test
      
      def test_opp
      b_v = Unbeat.new('X')
      assert_equal('O', b_v.get_opponent("X") )
      end

      def test_opp_2
      b_v = Unbeat.new('O')
      assert_equal('X', b_v.get_opponent("O") )
      end
      # def test_update
      # b_v = Board.new
      # b_v.update_position(0,"x")

      # assert_equal(['x','','','','','','','',''], b_v.ttt_board )
      # end

      # def test_update_2
      # b_v = Board.new
      # b_v.update_position(0,"x")
      # b_v.update_position(8,"o")
      # assert_equal(['x','','','','','','','','o'], b_v.ttt_board )
      # end
end