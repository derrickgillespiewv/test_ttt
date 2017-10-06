

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

      def test_win_block
      bv = b_v = Unbeat.new('X')
      assert_equal(2, b_v.get_win_or_block(['X','X','','','','','','',''], "X"))
      end

      def test_win_block_2
      bv = b_v = Unbeat.new('X')
      assert_equal(5, b_v.get_win_or_block(['','','','X','X','','','',''], "X"))
      end

      def test_win_block_3
      bv = b_v = Unbeat.new('X')
      assert_equal(4, b_v.get_win_or_block(['','X','','X','','X','','',''], "X"))
      end

       def test_fork_block
      bv = b_v = Unbeat.new('X')
      assert_equal(6, b_v.get_fork_or_block(['','','X','','','','','','X'], "X"))
      end

      def test_fork_block_2
      bv = b_v = Unbeat.new('X')
      assert_equal(1, b_v.get_fork_or_block(['X','','','X','','','','',''], "X"))
      end

      def test_fork_block_3
      bv = b_v = Unbeat.new('O')
      assert_equal(6, b_v.get_fork_or_block(['','','','O','','','','O',''], "O"))
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